class Articles {
  String? urlImage;
  String? title;
  String? description;
  String? url;
  NamePage? namePage;

  Articles({
    required this.urlImage,
    required this.title,
    required this.description,
    required this.url,
    required this.namePage,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlToImage'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    namePage = NamePage.fromJson(json['name']);
  }
}

class NamePage {
  int? id;
  String? name;
  NamePage.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
