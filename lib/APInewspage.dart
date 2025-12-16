import 'package:dio/dio.dart';

class NewsArticle {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  NewsArticle({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'] ?? 'No title',
      description: json['description'],
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'],
    );
  }

  String getFormattedDate() {
    try {
      final date = DateTime.parse(publishedAt);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return publishedAt;
    }
  }
}

class APINewsPage {
  final Dio _dio = Dio();
  
  static const String apiKey = 'd91d377ba1a94cc4b056b470e88055a0';
  static const String baseUrl = 'https://newsapi.org/v2';

  Future<List<NewsArticle>> getTopHeadlines({String country = 'us'}) async {
    try {
      final response = await _dio.get(
        '$baseUrl/top-headlines',
        queryParameters: {
          'country': country,
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List articles = response.data['articles'] ?? [];
        return articles.map((json) => NewsArticle.fromJson(json)).toList();
      } else {
        throw Exception('Lỗi tải tin tức: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
