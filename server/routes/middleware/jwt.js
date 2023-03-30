const jwt = require('jsonwebtoken')

 function auth(req,res,next) {
    try {
        
    const token = req.header('auth-token')
    if(!token){
       return res.send({message:"CANT ACCESS"});
    }

    const check =  jwt.verify(token,'huihuihuihii')
   req.user = check;
   console.log(req.a);
   next()
    } catch (error) {
        res.send(error).status(401)
    }
    
}

module.exports = auth;