import 'dart:convert';

import 'package:quick_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews(category) async {
    // category 0: india
    // category 1: global
    // category 2: business
    // category 3: entertainment
    // category 4: auto
    // category 5: science
    // category 6: sports
    // category 7: technology

    final apiKey = '92dde0a8775f42938294b5a8d3d7a082';
    var args;
    switch (category) {
      case 0:
        args = 'everything?q=india';
        break;
      case 1:
        args = 'everything?q=global';
        break;
      case 2:
        args = 'top-headlines?country=in&category=business';
        break;
      case 3:
        args = 'top-headlines?country=in&category=entertainment';
        break;
      case 4:
        args = 'everything?q=auto';
        break;
      case 5:
        args = 'top-headlines?category=science';
        break;
      case 6:
        args = 'everything?q=sports&language=en';
        break;
      case 7:
        args = 'everything?q=technology&language=en';
    }

    String url = 'https://newsapi.org/v2/$args' + '&apiKey=$apiKey';

    var response = await http.get(Uri.parse(url));

    var responseData = jsonDecode(response.body);

    if (responseData['status'] == 'ok') {
      responseData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

// class CategoryNews {
//   List<ArticleModel> news = [];

//   Future<void> getNews(String category) async {
//     String url = 'https://newsapi.org/v2/top-headlines?&country=in&category=' +
//         '$category&apiKey=92dde0a8775f42938294b5a8d3d7a082';

//     var response = await http.get(Uri.parse(url));

//     var responseData = jsonDecode(response.body);

//     if (responseData['status'] == 'ok') {
//       responseData['articles'].forEach((element) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           ArticleModel articleModel = new ArticleModel(
//               title: element['title'],
//               author: element['author'],
//               description: element['description'],
//               url: element['url'],
//               urlToImage: element['urlToImage'],
//               content: element['content']);
//           news.add(articleModel);
//         }
//       });
//     }
//   }
// }
