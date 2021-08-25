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

module.exports = router;