import 'package:flutter/material.dart';
import 'package:haber/model/artide_models.dart';
import 'package:haber/screens/detailPage.dart';

class NewsList extends StatefulWidget {
  const NewsList({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<Article> news;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isImage = true;

    return Column(
      children: List.generate(this.widget.news.length, (index) {
        Article tildedNews = widget.news[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (context, animation, animationTime, child) {
                  animation = CurvedAnimation(
                    curve: Curves.fastOutSlowIn,
                    parent: animation,
                  );
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center,
                  );
                },
                pageBuilder: (context, animation, animationTime) {
                  return DetailPage(
                    article: tildedNews,
                  );
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: tildedNews.urlToImage == null
                        ? Image.asset(
                            "assets/images/haber.png",
                            height: 120,
                            width: 120,
                          )
                        : Image.network(
                            tildedNews.urlToImage,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            getTruncatedTitle(
                              tildedNews.title,
                              60,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.grey[700],
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  calculateReadingTime(
                                    tildedNews.description.length,
                                  ),
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.grey[700],
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                // okuma süresinin ne kadar olduğunu yazdırdığımız text widget'ı
                                Text(
                                  tildedNews.publishedAt,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // haber başlıklarının uzunluğuna göre yazılması için yazılan kod bluğudur (operasyondur).

  String getTruncatedTitle(String text, int truncateNumber) {
    return text.length > truncateNumber
        ? text.substring(0, truncateNumber) + "..."
        : text;
  }

  // okuma süresinin belirlenmesi için yazılan kod bloğudur(operasyondur)

  String calculateReadingTime(int descriptionLength) {
    return '${descriptionLength > 200 ? (descriptionLength / 200).floor() : (descriptionLength / 200 * 100).floor()} ${descriptionLength > 200 ? "mins" : "seconds"} read';
  }
}
