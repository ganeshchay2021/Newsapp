class News{
  String? title;
  String? url;
  String? urlToImage;
  String? content;
  String? description;

  News({
    this.title,
    this.url,
    this.urlToImage,
    this.content,
    this.description,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
        title: map["title"],
        url: map["url"] ?? map["link"] ?? "https://fluttter.dev",
        urlToImage:map["urlToImage"] ?? "https://image.tmdb.org/t/p/w500/1kks3YnVkpyQxzw36CObFPvhL5f.jpg",
        content: map["content"],
        description: map["description"]);
  }
}
