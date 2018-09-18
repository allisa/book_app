CREATE TABLE IF NOT EXISTS books (
  id SERIAL PRIMARY KEY,
  author VARCHAR(256),
  title VARCHAR(256),
  isbn VARCHAR(256),
  image_url VARCHAR(256),
  description TEXT NOT NULL
);

INSERT INTO books (author, title, isbn, image_url, description) VALUES(
  'Sylvia Plath', 
  'The Bell Jar', 
  'ISBN_13 9780062444479', 
  'https://www.googleapis.com/books/v1/volumes/G-f1CQAAQBAJ',
  'Sylvia Plaths shocking, realistic, and intensely emotional novel about a woman falling into the grip of insanity Esther Greenwood is brilliant, beautiful, enormously talented, and successful, but slowly going under—maybe for the last time. In her acclaimed and enduring masterwork, Sylvia Plath brilliantly draws the reader into Esthers breakdown with such intensity that her insanity becomes palpably real, even rational—as accessible an experience as going to the movies. A deep penetration into the darkest and most harrowing corners of the human psyche, The Bell Jar is an extraordinary accomplishment and a haunting American classic.'
  );

INSERT INTO books (author, title, isbn, image_url, description) VALUES(
  'David Epstein', 
  'The Sports Gene', 
  'ISBN_13 9781617230127', 
  'https://www.googleapis.com/books/v1/volumes/00eKDQAAQBAJ',
  'A Sports Illustrated senior writers controversial exploration of the genetic underpinnings of athletic success explores the roles of both biology and training, arguing that nature and training are equally necessary components of athletic achievement while considering such topics as race, gender and genetic testing.'
  );

  INSERT INTO books (author, title, isbn, image_url, description) VALUES(
    'William Golding', 
    'Lord of the Flies', 
    'ISBN_13_9781101993224', 'http://books.google.com/books/content?id=r6eoCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 
    'William Goldings unforgettable classic of boyhood adventure and the savagery of humanity comes to Penguin Classics in a stunning Graphic Deluxe Edition with a new foreword by Lois Lowry As provocative today as when it was first published in 1954, Lord of the Flies continues to ignite passionate debate with its startling, brutal portrait of human nature. William Goldings compelling story about a group of very ordinary boys marooned on a coral island has been labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, and even a vision of the apocalypse. But above all, it has earned its place as one of the indisputable classics of the twentieth century for readers of any age. This Penguin Classics Graphic Deluxe Edition features an array of special features to supplement the novel, including a foreword by Lois Lowry, an introduction by Stephen King, an essay by E. M. Forster, an essay on teaching and reading the novel and suggestions for further exploration by scholar Jennifer Buehler, and an extended note by E. L. Epstein, the publisher of the first American paperback edition of Lord of the Flies. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators. From the Trade Paperback edition.');

    INSERT INTO books (author, title, isbn, image_url, description) VALUES(
      'Margaret Wise Brown', 
      'Goodnight Moon', 
      'ISBN_13_9780062662897',
      'http://books.google.com/books/content?id=dJNoDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 
      'Share this timeless classic with a new generation of readers! In a great green room, tucked away in bed, is a little bunny. And to all the familiar things in the softly lit room—to the picture of the three little bears sitting on chairs, to the clocks and his socks, to the mittens and the kittens, to everything one by one—the little bunny says goodnight. In this classic of childrens literature, beloved by generations of readers and listeners, the quiet poetry of the words and the gentle, lulling illustrations combine to make a perfect book for the end of the day.');

      INSERT INTO books (author, title, isbn, image_url, description) VALUES (
        'Philip K. Dick', 
        'Do Androids Dream of Electric Sheep?', 
        'ISBN_13 9780345508553', 'http://books.google.com/books/content?id=jUX8N9kiCiQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
        'A masterpiece ahead of its time, a prescient rendering of a dark future, and the inspiration for the blockbuster film Blade Runner By 2021, the World War has killed millions, driving entire species into extinction and sending mankind off-planet. Those who remain covet any living creature, and for people who cant afford one, companies built incredibly realistic simulacra: horses, birds, cats, sheep. Theyve even built humans. Immigrants to Mars receive androids so sophisticated they are indistinguishable from true men or women. Fearful of the havoc these artificial humans can wreak, the government bans them from Earth. Driven into hiding, unauthorized androids live among human beings, undetected. Rick Deckard, an officially sanctioned bounty hunter, is commissioned to find rogue androids and retire them. But when cornered, androids fight back—with lethal force.');


