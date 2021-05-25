import {Personajes} from '../models/Personajes.js'
import {Peliculas} from '../models/Peliculas.js'
import {Generos} from '../models/Generos.js'
// Listado de peliculas
const movies = async (req,res) =>{
    // Filtrado por titulo de pelicula movies?name=name
    if(req.query.name){
        const moviesByTitle = await Peliculas.findAll({where: {titulo:req.query.name}})
        res.json({
            moviesByTitle
        })  
    }
    // Filtrado de peliculas por generos movies?genre=genre
    else if(req.query.genre){
        const moviesByGender = await Generos.findAll({where: {nombre:req.query.genre} , include: [{model: Peliculas, required: true}]})
        res.json({
            moviesByGender
        })
    }
    // Filtro segun su fecha de creacion ASC || DESC     movies?order=order
    else if(req.query.order){
        const order = req.query.order; // valor ASC o DESC segun parametro 

        const moviesByOrder = await Peliculas.findAll({  order: [['fecha_creacion', order]]})

        res.json({
            moviesByOrder
        })
    } else {
 
        const moviesList = await Peliculas.findAll({
            attributes: ['imagen', 'titulo', 'fecha_creacion']
                    });
            
    
                res.json({
                    moviesList
                });
    
    }
  
  
       
}

// Detalles de la Pelicula
const movieDetail = async (req,res) =>{
    const{idpelicula}=req.params
   
    const movieDetail = await Personajes.findAll({where: {fk_idpelicula:idpelicula} , include: [{model: Peliculas, required: true}]})
        

            res.json({
                movieDetail
            })
}

// Crear pelicula
const movieCreate = async (req,res) =>{

    const{titulo, imagen, fecha_creacion , calificacion, fk_idpersonaje}=req.body

    const movieCreate = await Peliculas.create({
        titulo,
        imagen,
        fecha_creacion,
        calificacion,
        fk_idpersonaje
     });
 
     res.json({
        movieCreate
     })
      
}

// Editar pelicula
const movieUpdate = async (req,res) =>{

    const{titulo, imagen, fecha_creacion , calificacion, fk_idpersonaje}=req.body

    const movieUpdate = await Peliculas.update({   
        titulo,
        imagen,
        fecha_creacion,
        calificacion,
        fk_idpersonaje
        },
        { where:
        {
            idpelicula:req.params.idpelicula
        }})

        res.json({message: ` Pelicula ${titulo} actualizada con exito`})
}

// Eliminar pelicula
const movieDelete = async (req,res) =>{

    const movieDelete = await Peliculas.destroy({
        where: {
            idpelicula: req.params.idpelicula
        },
      })

      res.json({message: ` Pelicula  eliminada con exito !!`})
}
export{
    movies,
    movieDetail,
    movieCreate,
    movieUpdate,
    movieDelete
}