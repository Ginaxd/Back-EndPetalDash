const User = require('../models/user')

module.exports = {

    register(req, res){
        const user = req.body //capturando los datos
        User.create(user, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error',
                    error: err
                })
            }    
            return res.status(201).json({
                success: true,
                message: 'registro realizado correctamente',
                data: data // id del nuevo usuario
            })
        })
    }
}