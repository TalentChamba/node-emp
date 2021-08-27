const mysql = require("mysql");
const express = require('express');
const dotenv = require('dotenv');
const authController = require('../controllers/auth');

dotenv.config({ path: './.env'});

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE
});

const router = express.Router();

router.get('/', authController.isLoggedIn, (req, res) => {
  res.render('index', {
    user: req.user
  });
});

router.get('/register', (req, res) => {
  res.render('register');
});

router.get('/login', (req, res) => {
  res.render('login');
});


//route for homepage
router.get('/employee',(req, res) => {
  let sql = "SELECT * FROM employee_login";
  let conn = db.query(sql, (err, results) => {
    if(err) throw err;
    res.render('employee',{
      results: results
    });
  });
});





router.get('/delete/:id', function(req, res){
  const id = req.params.id;
  console.log(id);
  const sql = `DELETE FROM employee_login WHERE id=${id}`;

  db.query(sql, function(err, result) {
    if (err) throw err;
    console.log('record deleted!');
    res.redirect('/employee');
  });
});

router.get('/edit/:id', function(req, res){
  // /const id = 6;
  const id = req.params.id;
  const sql = `SELECT * FROM employee_login WHERE id=${id}`;
  db.query(sql, function(err, results) {
    if (err) throw err;
    res.render('edit',{
      results: results
    });
  });
});

router.post('/edit/:id', function(req, res){
  //todo to remove hardcoded value befor submission
  const id = 8;
  console.log(id, "++++++++");
  const { name, email} = req.body;
 var sql = `UPDATE employee_login SET name="${name}", email="${email}" WHERE id= '${id}'`;
db.query(sql, function(err, result) {
  if (err) throw err;
  console.log('record updated!');
  res.redirect('/profile');
});
});


router.get('/profile', authController.isLoggedIn, (req, res) => {
  console.log(req.user);
  if( req.user ) {
    res.render('profile', {
      user: req.user
    });
  } else {
    res.redirect('/login');
  }
  
})

//set to upload profile image
const uuid = require('uuid');
router.post("/upload", (req, res) => {
 if (!req.files) {
     res.send("No file upload")
 } else {
  const file = req.files.image 
           //for image upload
    if (file.mimetype == "image/jpeg" || file.mimetype == "image/png" || file.mimetype == "image/gif") {
         const imageName = file.name
         const uuidname = uuid.v1(); // this is used for unique file name
        const imgsrc = '/images/' + uuidname + file.name;
         const insertData = "INSERT INTO users_file(file_src)VALUES(?)"
         db.query(insertData, [imgsrc], (err, result) => {
               if (err) throw err
             file.mv('public/images/' + uuidname + file.name)
             res.render('profile', {
              res: res
            });
           })
       }
      
   }
})


module.exports = router;