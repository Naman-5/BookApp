# BookApp
A simple book store application built using Flutter, powered by Node.js &amp; MongoDB backend

## Application Screenshots
Home            |  All Books
:-------------------------:|:-------------------------:
![AppHome](screenshots/home.png)  | ![All Books](screenshots/allBooks.png)

Book Details            |  Book Details 
:-------------------------:|:-------------------------:
![AppHome](screenshots/bookDetails1.png)  | ![All Books](screenshots/bookDetails2.png)

## API Curl

### Home Page API
```
curl -i \
-H "content-type: application/json; charset=utf-8" \
-H "client-secret: client-secret" \
"http://127.0.0.1:5000/home/"
```

### Book Details API
```
curl -i \
-H "content-type: application/json; charset=utf-8" \
-H "client-secret: client-secret" \
"http://127.0.0.1:5000/book/64aaacc2a1eb5161560cf6c3"
```

### Book Search API
```
curl -i \
-X POST \
-H "content-type: application/json; charset=utf-8" \
-H "client-secret: client-secret" \
-H "content-length: 17" \
-d "{\"searchTerm\":\"\"}" \
"http://127.0.0.1:5000/book/bookSearch"
```