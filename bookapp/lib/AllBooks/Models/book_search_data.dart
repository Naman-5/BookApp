class BookSearchData {
  List<Data>? data;

  BookSearchData({this.data});

  BookSearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? author;
  String? genre;
  String? coverImage;
  num? price;
  num? rating;
  num? pageCount;
  String? about;
  String? category;
  String? contentLink;
  String? createdAt;
  String? updatedAt;
  num? iV;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
