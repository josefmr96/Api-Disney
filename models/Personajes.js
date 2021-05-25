import Sequelize from 'sequelize';
import db from '../config/db.js';
import {Peliculas} from './Peliculas.js'

export const Personajes = db.define('personajes',{
    idpersonaje:{
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    
    nombre:{
        type: Sequelize.STRING
    },
    
    edad:{
        type: Sequelize.STRING
    },
    
    peso:{
        type: Sequelize.NUMBER
    },
    
    historia:{
        type: Sequelize.STRING
    },

    imagen:{
        type: Sequelize.STRING
    },

    fk_idpelicula:{
        type: Sequelize.INTEGER
    }

}); 
Peliculas.belongsTo(Personajes, { foreignKey: 'fk_idpersonaje', });
Personajes.belongsTo(Peliculas, { foreignKey: 'fk_idpelicula', });
