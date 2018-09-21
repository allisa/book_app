'use strict';
//application dependencies
const express = require('express');
const pg = require('pg');
const dotenv = require('dotenv');
const ejs = require('ejs');
const superagent = require('superagent');

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
app.get('/books/newform', getNewBook);
app.get('/books/findbook', getBookSearch);
app.post('/searches', searchBook);
app.get('/books/:id', getSingleBook);
app.get('/', (request, response) => response.redirect('/books'));
app.get('*', renderError);
app.post('/books', postNewBook);

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

function getNewBook(request, response) {
  return response.render('pages/books/newbook', {pageTitle: 'Add Book to the Library'});
}

function getBookSearch(request, response) {
  return response.render('pages/searches/findbook', {pageTitle: 'Search by Title or Author'});
}
function searchBook(request, response) {
  let searchtype = '';
  request.body.title ? searchtype = 'intitle': searchtype = 'inauthor';
  let url = `https://www.googleapis.com/books/v1/volumes?q=${searchtype}:${request.body.searchTitleAuthor}`;

  superagent.get(`${url}`)
    .then(data => {
      return response.send(data)
    });
}

function getSingleBook(request, response) {
  let SQL = 'SELECT * FROM books WHERE id = $1';
  let values = [ request.params.id ];

  return client.query(SQL, values)
    .then( (result) => response.render('pages/books/show', {
      pageTitle: 'Book Details',
      book: result.rows[0]}))
    .catch(error => response.render('./error', {error: error}));
}

function renderError(request, response) {
  response.render('pages/error', {error: {status: 404, message: 'Not Found'}});
}

function postNewBook(request, response) {
  let SQL ='INSERT INTO books (title, author, isbn, image_url, description) VALUES ($1, $2, $3, $4, $5) RETURNING id;';
  let values = [request.body.title, request.body.author, request.body.isbn, request.body.image_url, request.body.description];

  client.query(SQL, values, (err, result) => {
    response.redirect(`/books/${result.rows[0].id}`);
  });
}

//End of helper functions

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}!`);
});