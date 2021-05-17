import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_news/helper/data.dart';
import 'package:quick_news/helper/news.dart';
import 'package:quick_news/models/article_model.dart';
import 'package:quick_news/models/category_model.dart';
import 'package:quick_news/views/article_view.dart';

int selectedIndex = 0;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews(selectedIndex);
  }

  getNews(index) async {
    News updated = News();
    await updated.getNews(index);
    articles = updated.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff121212),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quick'),
            Text(
              categories[selectedIndex].categoryName,
              style: TextStyle(color: Colors.indigoAccent),
            ),
            Text(
              'News',
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Categories
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                    currentIndex: index,
                    onTap: () {
                      getNews(index);
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            // NewsItem
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.95,
                        //color: Colors.orange,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: NewsTile(
                                  imageUrl: articles[index].urlToImage,
                                  title: articles[index].title,
                                  description: articles[index].description,
                                  url: articles[index].url,
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final String imageUrl, categoryName;
  final int currentIndex;
  final Function onTap;

  CategoryTile(
      {this.imageUrl, this.categoryName, this.currentIndex, this.onTap});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              width: 120,
              height: 60,
              child: Text(
                widget.categoryName,
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  NewsTile({this.imageUrl, this.title, this.description, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      newsUrl: url,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.indigo,
          child: Column(
            children: [
              Image.network(
                imageUrl,
              ),
              Container(
                padding: EdgeInsets.only(right: 6, left: 6, top: 6),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
