import Sequelize from 'sequelize';
import db from '../config/db.js';

export const Generos = db.define('generos',{
    idgenero:{
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    nombre:{
        type: Sequelize.STRING
    },
    imagen:{
        type: Sequelize.STRING
    },
    fk_idpelicula:{
        type: Sequelize.INTEGER
    }

}); 