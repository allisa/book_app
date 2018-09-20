'use strict';
//application dependencies
const express = require('express');
const pg = require('pg');
const dotenv = require('dotenv');
const ejs = require('ejs');

//application setup
const app = express();
dotenv.config();
const PORT = process.env.PORT;

//database setup
const conString = process.env.DATABASE_URL;
const client = new pg.Client(conString);
client.connect();
client.on('error', error => {
  console.error(error);
});

//application middleware
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static('public'));

app.set('view engine', 'ejs');

//api routes
app.get('/books', getBooks);
app.get('/books/:id', getSingleBook);
app.get('/', (request, response) => response.redirect('/books'));

app.get('/hello', serveHello);

app.get('*', renderError);

//adding new book
app.('/books/hewform', (request, response) => {
  response.render('newbook');
});

app.post('/books', (request, response) => {

})

//helper function
function getBooks(request, response) {
  let SQL = 'SELECT * FROM books;';

  return client.query(SQL)
    .then( (result) => response.render('index', {
      books: result.rows,
      pageTitle: 'Book Library',
      count: result.rows.length}))
    .catch(error => response.render('./error', {error: error}));
}

function getSingleBook(request, response) {
  let SQL = 'SELECT * FROM books WHERE id = $1';
  let values = [ request.params.id ];

  return client.query(SQL, values)  
    .then( (result) => response.render('show', {
      pageTitle: 'Book Details', 
      book: result.rows[0]}))
    .catch(error => response.render('./error', {error: error}));
}

function serveHello(request, response) {
  response.render('./hello');
}

function renderError(request, response) {
  response.render('./error', {error: {status: 404, message: 'Not Found'}});
}

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}!`);
});
