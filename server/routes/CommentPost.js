const Router = require('express').Router()
const db = require('../connection/Mysql')
const auth = require('./middleware/jwt')

Router.post('/:postId',auth,(req,res)=>{
    const text = req.body.text;
    const user = req.user;
let postId = req.params.postId;
let query = "INSERT INTO  comment (text,user_id,post_id) VALUES (?,?,?)"

db.query(query,[text,user.user.id,postId],(err,result)=>{
    try {
        
    if(err){
        return res.json(err).status(400);
    }
    res.json({message:"USER HAS COMMENTED"})
    } catch (error) {
        return res.json(error).status(500)
    }
})
})

Router.get('/:postId',auth,(req,res)=>{
    let postId = req.params.postId;
    let query = "SELECT * FROM comment  JOIN user ON user_id = user.id WHERE post_id = ?"
    db.query(query,[postId],(err,result)=>{
        if(err){
            return res.status(400).json(err)
        }
        res.json(result)
    })
})
Router.delete('/:id',auth,(req,res)=>{
    let {id} = req.params;
    let user = req.user;
    db.query("SELECT * FROM comment WHERE id = ? AND user_id = ?",[id,user.user.id],(err,result)=>{
      if(err){
        return res.status(500).json(err)
      }
      if(result.length > 0){
        let comment = result[0];
        console.log(comment.user_id);
        if(comment.user_id == user.user.id){
          db.query("DELETE FROM comment WHERE id = ?",[id],(err,result)=>{
            if(err){
              return res.status(400).json(err)
            }
            else{
              res.json({MESSAGE:"DELETED COMMENT"})
            }
          })
        }
        else{
          return res.status(401).json({MESSAGE:"YOU CANT DELETD THIS COMMENT"})
        }
      } else {
        return res.status(404).json({MESSAGE:"COMMENT NOT FOUND"})
      }
    })
  })
  
module.exports = Router;