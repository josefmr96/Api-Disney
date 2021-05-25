import {Usuarios} from '../models/Usuarios.js';
import jwt from 'jsonwebtoken';
import {config} from '../config/config.js'

export const verifyToken = async (req, res, next) =>{
  try {
    const token = req.headers["x-access-token"];

    if(!token) return res.status(403).json({message: "Token no encontrado"});
    const decoded = jwt.verify(token,config.SECRET);
    req.idusuario = decoded.id
    
    const user = await Usuarios.findByPk(req.idusuario);
    console.log(user)
    if(!user) return res.status(404).json({message: 'Usuario no encontrado'});

    next();
  } catch (error) {
      return res.status(401).json({message:"No estas autorizado"})
      
  }
    
}