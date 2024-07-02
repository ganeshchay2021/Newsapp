// class News {
//   String? title;
//   String? url;
//   String? urlToImage;
//   String? content;
//   String? description;

//   News({
//     this.title,
//     this.url,
//     this.urlToImage,
//     this.content,
//     this.description,
//   });

//   factory News.fromMap(Map<String, dynamic> map) {
//     String? imageUrl = map["image_url"];
//     String defaultImageUrl =
//         "https://image.tmdb.org/t/p/w500/1kks3YnVkpyQxzw36CObFPvhL5f.jpg";

//     return News(
//       title: map["title"],
//       url: map["url"] ?? map["link"] ?? "https://fluttter.dev",
//       urlToImage: isValidUrl(imageUrl) ? imageUrl : defaultImageUrl,
//       content: map["content"],
//       description: map["description"],
//     );
//   }
// }

// bool isValidUrl(String? urlString) {
//   if (urlString == null) return false;

//   try {
//     Uri.parse(urlString);
//     return true;
//   } catch (_) {
//     return false;
//   }
// }
