const Router = require('express').Router()
const db = require('../connection/Mysql')
const Joi = require('joi')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const auth = require('./middleware/jwt')
// IMPORT 



// ROUTES



Router.post('/', async (req, res) => {

    const { username, country, anonymous_name, password, profile_pic,email } = req.body;
    // GETTING INFO FROM FRONT-END
    db.query('SELECT * FROM user WHERE email = ?',[email],(err,result)=>{
        if(err){
            return res.json(err);
        }

        if(result.length > 0){
         return   res.json({message:"USER ALREADY EXIST WITH THAT EMAIL"})
        }
        else{

    // GOING TO CHECK ONLY ONE email
    const joi = Joi.object({
        username: Joi.string().min(6).max(40).required(),
        country: Joi.string().min(1).max(40).required(),
        anonymous_name: Joi.string().min(6).max(40).required(),
        password: Joi.string().min(6).max(70).required(),
        profile_pic: Joi.string().max(799).required(),
        email:Joi.string().min(4).max(250).email().required()
    })

    //  USING JOI TO VALIDATE THE DATA  
    const { error } = joi.validate({ username: username, country: country, anonymous_name: anonymous_name, password: password, profile_pic: profile_pic,email:email })
  
    // THIS ERROR WILL TAKE PLACE IF USER SEND INCORRECT DATA

    if (error) {
        return res.json(error).status(401)
    }
    //  HASHING PASSWORD 
    const HashPassword =  bcrypt.hashSync(password,10)

    let query = "INSERT INTO user (country,anonymous_name,username,password,profile_pic,email) VALUES (?,?,?,?,?,?)"
    db.query(query,[country,anonymous_name,username,HashPassword,profile_pic,email],(err,result)=>{

        // THIS ERROR IF SOMETHING GOES WRONG WHILE INSERTING INTO DATABSE
        if(err){
            return res.status(500).json(err)
        }
        
        res.json({MESSAGE:"USER CREATED"});
    })


        }
    })
})
//  LOGIN API FOR USER 
Router.post('/login', (req, res) => {
  const { email, password } = req.body;

  const query = "SELECT * FROM user WHERE email = ?";
  db.query(query, [email], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Internal server error" });
    }

    console.log(results);

    const user = results[0];

    console.log(user);

    if (!user) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    const passwordMatch = bcrypt.compareSync(password, user.password);

    if (!passwordMatch) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    const token = jwt.sign({ user }, 'huihuihuihii');
    res.header('auth-token', token).send('USER LOGIN');
  });
});
// USER MODULE COMPLETE HERE 
module.exports = Router;