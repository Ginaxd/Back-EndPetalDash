const usersController = require('../controllers/usersController');
const passport = require('passport')

module.exports = (app, upload) => {

    // GET -> OBTENER DATOS
    // POST -> ALMACENAR DATOS
    // PUT -> ACTUALIZAR DATOS
    // DELETE -> ELIMINAR DATOS

    app.post('/api/users/create', usersController.register);
    app.post('/api/users/createWithImage', upload.array('image', 1), usersController.registerWithImage);
    app.post('/api/users/login', usersController.login);
    
    app.put('/api/users/update',  upload.array('image', 1), usersController.registerWithImage);
    app.put('/api/users/update',  usersController.updateWithuotImage);

}

