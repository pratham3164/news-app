class Article {
  String sourceName;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  bool isSaved;
  Article({
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.isSaved,
  });

  Article.fromJson(Map<String, dynamic> json) {
    sourceName = json['source'] != null ? json['source']['name'] : '.......';
    author = json['author'];
    title = json['title'];
    description = json['description'] != null
        ? json['description']
        : json['content'] != null ? json['content'] : ' ......';
    url = json['url'];
    urlToImage = json['urlToImage'] != null
        ? json['urlToImage']
        : 'https://t3.ftcdn.net/jpg/02/70/09/98/240_F_270099822_9zbx236dHn1hyxYNl9HSOBvpUEpU0eOz.jpg';
    publishedAt = json['publishedAt'];
    content = json['content'] != null ? json['content'] : '......';
    isSaved = false;
  }
}
