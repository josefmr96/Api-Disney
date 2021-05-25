import Sequelize from 'sequelize';
import db from '../config/db.js';
import bcrypt from 'bcryptjs'


export const Usuarios = db.define('usuarios',{
    idusuario:{
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    nombre:{
        type: Sequelize.STRING
    },
    correo:{
        type: Sequelize.STRING
    }, 
    contraseña:{
        type: Sequelize.STRING
    },
   

}) 


Usuarios.encryptPassword = async (password) =>{

    const salt = await bcrypt.genSalt(10);
    return await bcrypt.hash(password,salt);
}

Usuarios.comparePassword = async (password, receivedPassword) =>{
    return await bcrypt.compare(password, receivedPassword)}
