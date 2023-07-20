const express = require('express')
const app = express()
const http = require('http')
const server = http.createServer(app)
const logger = require('morgan')
const cors = require('cors')
const passport = require('passport');
const multer = require('multer')

/* 
    importar las rutas
*/
const userRoutes = require('./routes/userRoutes')


const port = process.env.PORT || 3000

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({
    extende: true
}))
app.use(cors())
app.use(passport.initialize());
app.use(passport.session());

require('./config/passport')(passport);

app.disable('x-powered-by');

app.disable('x-powered-by')


app.set('port', port)

const upload = multer({
    storage: multer.memoryStorage()
})

/* 
    llamado de las rutas
*/
userRoutes(app, upload)



server.listen(3000, '192.168.0.4' || 'localhost', function () {
    console.log('Aplicacion de nodeJS ' + port + ' iniciada...')
})

app.get('/', (req, res) => {
    res.send('ruta raiz del backend')
})

app.get('/test', (req, res) => {
    res.send('esta es la ruta test')
})

//manejo de errores
app.use((err, req, res, next) => {
    console.log(err)
    res.status(err.status || 500).send(err.stack);
})

//200 mensaje exitoso
//404 url no existe
//500 error interno del codigo