class HomeDataModel {
  String? message;
  Data? data;

  HomeDataModel({this.message, this.data});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Books>? books;

  Data({this.books});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Books'] != null) {
      books = <Books>[];
      json['Books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['Books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  String? header;
  List<BookList>? bookList;

  Books({this.header, this.bookList});

  Books.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    if (json['bookList'] != null) {
      bookList = <BookList>[];
      json['bookList'].forEach((v) {
        bookList!.add(new BookList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    if (this.bookList != null) {
      data['bookList'] = this.bookList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookList {
  String? sId;
  String? title;
  String? author;
  String? genre;
  String? coverImage;
  double? price;
  double? rating;
  int? pageCount;
  String? about;
  String? category;
  String? contentLink;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BookList(
      {this.sId,
      this.title,
      this.author,
      this.genre,
      this.coverImage,
      this.price,
      this.rating,
      this.pageCount,
      this.about,
      this.category,
      this.contentLink,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BookList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    author = json['author'];
    genre = json['genre'];
    coverImage = json['coverImage'];
    price = json['price'];
    rating = json['rating'];
    pageCount = json['pageCount'];
    about = json['about'];
    category = json['category'];
    contentLink = json['contentLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['author'] = this.author;
    data['genre'] = this.genre;
    data['coverImage'] = this.coverImage;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['pageCount'] = this.pageCount;
    data['about'] = this.about;
    data['category'] = this.category;
    data['contentLink'] = this.contentLink;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
