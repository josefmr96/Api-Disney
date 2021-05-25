import {Usuarios} from '../models/Usuarios.js';
import jwt from 'jsonwebtoken';
import {config} from '../config/config.js'
import nodemailer from 'nodemailer'


const login = async (req,res)=>{
    //encontrar un usuario con el mismo correo
const{correo, password}=req.body;
    const usuario = await Usuarios.findOne({where : {correo}});
    if (!usuario) return res.status(401).json({message:"Usuario no Encontrado"}) 

    const usuarioContraseña = await Usuarios.comparePassword(password, usuario.contraseña)
    if (!usuarioContraseña) return res.status(401).json({message: "Contraseña invalida"})

    const token = jwt.sign({id:usuario.idusuario}, config.SECRET, {
        expiresIn:86400
    })

    res.json({token})
 
    

}
const register = async (req,res)=>{
    const{nombre, correo, password}=req.body;
    // Datos del transporter
    const transporter = nodemailer.createTransport({
        host: 'smtp.ethereal.email',
        port: 587,
        auth: {
            user: 'virginie.rempel99@ethereal.email',
            pass: 'H7kM8SgDtCJhjFWYaf'
        }
    });
    // Datos del correo a enviar   
    const mailOptions = {
        from: 'virginie.rempel99@ethereal.email',
        to: correo ,
        subject: 'Registro Exitoso',
        text: 'Bienvenido a la Api-Disney'
};
    // Crear Usuario para obtener Token de validación
    await Usuarios.create({
         nombre,
         correo,
         contraseña: await Usuarios.encryptPassword(password)
     });
     const token = jwt.sign({id:Usuarios.idusuario}, config.SECRET, {
         expiresIn:86400
     })
     res.json({token})

     // Envio  de correo 
transporter.sendMail(mailOptions, function(error, info){
    if (error){
        console.log(error);
        res.send(500, err.message);
    } else {
        console.log("Email sent");
        res.status(200).json({message:`Se ha enviado un correo a la dirección ${correo}`});
    }
});

}


export{
    login,
    register
}