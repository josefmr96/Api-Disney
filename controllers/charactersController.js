import {Personajes} from '../models/Personajes.js'
import {Peliculas} from '../models/Peliculas.js'

// Listado de personajes y filtros
const characters = async (req,res) =>{

// Filtrado por nombre characters?name=name
    if(req.query.name){
        const charactersByName = await Personajes.findAll({where: {nombre:req.query.name}})
        res.json({
            charactersByName
        })
    } 

// Filtrado por edad characters?age=age
    else if(req.query.age){
        const charactersByAge = await Personajes.findAll({where: {edad:req.query.age}})
        res.json({
            charactersByAge
        })
        
    } 

// Filtrado de personajes por peliculas characters?movies=idpelicula
    else if(req.query.movies){
        const charactersByMovies = await Personajes.findAll({where: {fk_idpelicula:req.query.movies} , include: [{model: Peliculas, required: true}]})
        res.json({
            charactersByMovies
        })
        
    }

// Obtener todos los personajes y mostrar "nombre, imagen"
    else{
        const personaje = await Personajes.findAll({
            attributes: ['nombre', 'imagen']
                    });
                    
                res.json({
                    personaje
                })
    }

     
       
}
// Detalles del personaje seleccionado por "id"

const charactersDetail = async (req,res) =>{
    const{idpersonaje}=req.params

    const personaje = await Personajes.findOne({where: {idpersonaje}}) // Obtener personaje por "id"
    const peliculas = await Peliculas.findAll({where: {fk_idpersonaje:idpersonaje}}) // Filtrar peliculas en donde apeceriera el personaje con el "id" filtrado

            res.json({
                personaje,
                peliculas
            })

       
}

// Crear personaje
const charactersCreate = async (req,res) =>{

    const{nombre, edad, peso , historia, imagen, fk_idpelicula}=req.body

   const charactersCreate = await Personajes.create({
        nombre,
        edad,
        peso,
        historia,
        imagen,
        fk_idpelicula
    });

    res.json({
        charactersCreate
    })
     
       
}

// Actualizar personaje por "id"
const charactersUpdate = async (req,res) =>{
    const{nombre, edad, peso , historia, imagen, fk_idpelicula}=req.body
    
   const charactersUpdate = await Personajes.update(
        // Valores a actualizar
        {nombre,
        edad,
        peso,
        historia,
        imagen,
        fk_idpelicula
        },
       { where:
        {
            idpersonaje:req.params.idpersonaje
        }})

    res.json({message: ` personaje ${nombre} actualizado con exito`})
     
       
}

// Eliminar personaje por "id"
const charactersDelete = async (req,res) =>{

    const charactersDelete = await Personajes.destroy({
        where: {
            idpersonaje: req.params.idpersonaje
        },
      })
      res.json({message: ` Personaje  eliminado con exito`})
}

export{
    characters,
    charactersCreate,
    charactersUpdate,
    charactersDelete,
    charactersDetail
}