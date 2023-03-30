const Router = require('express').Router()
const db = require('../connection/Mysql')
const auth = require('./middleware/jwt')
// IMPORTS 


// POST ROUTES FOR CREATING A POST 
Router.post('/create', auth, async (req, res) => {
    const user = req.user;
    const { subject, picture_video } = req.body;
    console.log(user.user.id);
    let query = "INSERT INTO post (subject,picture_video,user_id) VALUES (?,?,?)"
    db.query(query, [subject, picture_video, user.user.id], (err, result) => {
        try {
            if (err) {
                return res.status(402).json(err);
            }
            else {
                return res.json({ message: "POST CREATED" })
            }
        } catch (error) {
            if (error) {
                return res.json(error)
            }
        }
    })
})

// GET POST IN THE LOCAL AREA COMMUNITY 

Router.get('/get', auth, (req, res) => {
  let query = "SELECT post.*, user.username, user.email FROM post JOIN user ON user.id = post.user_id"

    db.query(query, (err, result) => {
        if (err) {
            return res.json(err).status(400)
        }
        else {
            return res.json(result)
        }
    })
})

//  PROFILE API WHERE USER CAN SEE HIS ALL POSTS 
Router.get('/SingleUser', auth, (req, res) => {
    let user = req.user;
    let query = "SELECT * FROM post WHERE user_id = ?"
    db.query(query, [user.user.id], (err, result) => {
        if (err) {
            throw err;
        }
        else {
            return res.json(result)
        }
    })

})
//DELETE API WHERE USER CAN DELETE ITS POST WHEN HE GOES TO PROFILE SECTION
Router.delete('/deletePOST:id', auth, (req, res) => {
    let id = req.params.id;
    let query = "DELETE FROM post WHERE id = ?"
    db.query(query, [id], (err, result) => {
        if (err) {
            res.status(400).json(err)
        }
        else {
            res.status(200).json({ message: "POST HAS BEEN DELETE" })
        }
    })
})

// CREATING LIKE API AND DISLIKE API 
Router.post('/like/:postId', auth, (req, res) => {
    const postId = req.params.postId;
    const user = req.user;
    let query = "SELECT * FROM likes WHERE userId = ? AND postId = ?";
    db.query(query, [user.user.id, postId], (err, result) => {
      try {
        if (err) {
          return res.status(400).json(err);
        }
        if (result.length > 0) {
          const liked = result[0];
          if (liked.liked == 1) {
            db.query("UPDATE likes SET liked = 0 WHERE id = ?", [liked.id], (err, result) => {
              if (err) {
                return res.status(400).json(err);
              }
              db.query("UPDATE post SET likes_count = likes_count - 1 WHERE id = ?", [postId], (err, result) => {
                if (err) {
                  return res.status(400).json(err);
                }
                res.json({ message: "User unliked the post" });
              });
            });
          } else {
            db.query("UPDATE likes SET liked = 1 WHERE id = ?", [liked.id], (err, result) => {
              if (err) {
                return res.status(400).json(err);
              }
              db.query("UPDATE post SET likes_count = likes_count + 1 WHERE id = ?", [postId], (err, result) => {
                if (err) {
                  return res.json(err).status(400);
                }
                res.json({ message: "User liked the post" });
              });
            });
          }
        } else {
          db.query("INSERT INTO likes (userId, postId, liked) VALUES (?, ?, ?)", [user.user.id, postId, 1], (err, result) => {
            if (err) {
              return res.status(400).json(err);
            }
            db.query("UPDATE post SET likes_count = likes_count + 1 WHERE id = ?", [postId], (err, result) => {
              if (err) {
                return res.json(err).status(400);
              }
              res.json({ message: "User liked the post" });
            });
          });
        }
      } catch (error) {
        res.status(500).json(error);
      }
    });
  });
    // USE THIS LIKE API COUNT TO DISPLAY THE NUMBER OF TOTAL LIKES ON THE POST
  Router.get('/likesCount/:postId',auth,(req,res)=>{
    let postId = req.params.postId;
    db.query("SELECT * FROM  post WHERE id = ?",[postId],(err,result)=>{
    try {
            if(err){
                return res.status(400).json(err);
            }
            console.log(result);
            res.json(result[0].likes_count);
    } catch (error) {
         res.json(error).status(500)
    }
    })
  })
module.exports = Router
