import express from 'express';
import {verifyToken} from '../middlewares/authJwt.js';
import {login,register} from '../controllers/authController.js';
import {characters,charactersCreate,charactersUpdate,charactersDelete,charactersDetail} from '../controllers/charactersController.js'
import {movies,movieCreate,movieUpdate,movieDelete,movieDetail} from '../controllers/moviesController.js';
const router = express.Router();



router.post('/auth/login', login ); // Ingreso de usuario para  obtener Token

router.post('/auth/register', register); // Registro de usuario

//                                 ----- RUTAS PERSONAJES ----

router.get('/characters', verifyToken, characters ); // Listado de personajes

router.post('/characters', verifyToken, charactersCreate ); // Crear personaje

router.get('/characters/:idpersonaje', verifyToken, charactersDetail ); // Detalles personaje

router.post('/characters/:idpersonaje', verifyToken, charactersUpdate ); // Actualizar personaje

router.delete('/characters/:idpersonaje', verifyToken, charactersDelete ); // Eliminar personaje

//                                 ----- RUTAS PELICULAS ----

router.get('/movies', verifyToken, movies); // Listado de peliculas

router.post('/movies', verifyToken, movieCreate); // Crear Pelicula

router.get('/movies/:idpelicula', verifyToken, movieDetail); // Detalles pelicula

router.post('/movies/:idpelicula', verifyToken, movieUpdate); // Actualizar pelicula

router.delete('/movies/:idpelicula', verifyToken, movieDelete); // Eliminar Pelicula


export default router