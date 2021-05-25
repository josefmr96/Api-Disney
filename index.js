import express from 'express';
import router from './routes/index.js'
import db from './config/db.js'
import bodyParser from 'body-parser'

const app = express();

//conectar db
db.authenticate()
    .then(()=> console.log('Base de datos conectada'))
    .catch(error=> console.log(error));

const port = process.env.PORT || 4000;

//habilitar pug

app.set('view engine', 'pug');

//agregar body parser
app.use(express.urlencoded({extended:true}));
app.use(bodyParser.json());

//definir carpeta public
app.use(express.static('public'));

app.use('/', router);


app.listen(port,()=>{
    console.log(`El servido esta funcionando en el puerto ${port}`)
});