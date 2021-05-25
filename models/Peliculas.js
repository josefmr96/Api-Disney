import Sequelize from 'sequelize';
import db from '../config/db.js';
import {Generos} from '../models/Generos.js'

export const Peliculas = db.define('peliculas',{
    idpelicula:{
        type: Sequelize.INTEGER,
        primaryKey: true
    },

    imagen:{
        type: Sequelize.STRING
    },

    titulo:{
        type: Sequelize.STRING
    },

    fecha_creacion:{
        type: Sequelize.STRING
    },
    calificacion:{
        type: Sequelize.NUMBER
    },
    fk_idpersonaje:{
        type: Sequelize.INTEGER
    }

}); 

Peliculas.belongsTo(Generos, { foreignKey: 'idpelicula', });
Generos.belongsTo(Peliculas, { foreignKey: 'fk_idpelicula', });