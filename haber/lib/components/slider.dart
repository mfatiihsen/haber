import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:haber/constant.dart';
import 'package:haber/screens/detailPage.dart';
//import 'package:haber/screens/detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:haber/model/artide_models.dart';

int activeIndex = 0;

class SliderNews extends StatefulWidget {
  const SliderNews({Key? key, required this.articleList}) : super(key: key);
  final List<Article> articleList;
  @override
  _SliderNewsState createState() => _SliderNewsState();
}

class _SliderNewsState extends State<SliderNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 250.0,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            reverse: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: 6,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.articleList[index].urlToImage;
            Article article = widget.articleList[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, animationTime, child) {
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
                          article: article,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          urlImage,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        getTruncatedTitle(widget.articleList[index].title, 40),
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        buildIndicator(),
      ],
    );
  }

  String getTruncatedTitle(String text, int truncateNumber) {
    return text.length > truncateNumber
        ? text.substring(0, truncateNumber) + "..."
        : text;
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 6,
        effect: WormEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: primaryColor,
          dotColor: Colors.black12,
        ),
      );
}
