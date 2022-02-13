import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:haber/components/news_list_widget.dart';
import 'package:haber/components/slider.dart';
import 'package:haber/constant.dart';
import 'package:haber/model/artide_models.dart';
import 'package:haber/screens/menuItemScreen/app_info_screen.dart';
import 'package:haber/screens/menuItemScreen/comment_app_screen.dart';
import 'package:haber/screens/menuItemScreen/other_app_screen.dart';
import 'package:haber/screens/menuItemScreen/rete_app_screen.dart';
import 'package:haber/services/advert_service.dart';
import 'package:haber/services/api_service.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  int currentIndex = 0;
  bool? isLoaded;
  BannerAd? _adH;
  void initState() {
    super.initState();
    _adH = BannerAd(
      size: AdSize.banner,
      adUnitId: AdService.detailBannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              isLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (_, error) {
          print("Reklam  yüklenemedi : $error");
        },
      ),
      request: AdRequest(),
    );
    _adH!.load;
  }

  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        height: 150,
        child: AdWidget(
          ad: _adH!,
        ),
        width: _adH!.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
              right: 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(
                0.2,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.sort, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 20,
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(
                0.2,
              ),
            ),
            child: IconButton(
              onPressed: () => exit(0),
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            Text(
              "HABERLER",
              style: GoogleFonts.oswald(
                color: Colors.black,
              ),
            ),
            Container(
              height: 3,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Text(
              "MFS SOFTWARE",
              style: GoogleFonts.oswald(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                headerDrawer(),
                drawerList(),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
                child: Column(
                  children: [
                    //Divider(),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 5,
                            height: 20,
                            color: primaryColor,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Merhaba!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SliderNews(articleList: articles!),
                    // SizedBox(height: 10),
                    // checkForAd(),
                    // SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    //checkForAd(),
                    //SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                color: primaryColor,
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Güncel Haberler",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(""),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    NewsList(
                      news: articles,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        },
      ),
      // bottomNavigationBar: Row(
      //   children: [
      //     checkForAd(),
      //   ],
      // ),
    );
  }

  Widget headerDrawer() {
    return Container(
      color: primaryColor,
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 40),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/mfs.png"),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Haber : En Güncel Haberler",
            style: GoogleFonts.karla(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "MFS SOFTWARE © 2021",
            style: GoogleFonts.karla(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget drawerList() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          menuItem(),
        ],
      ),
    );
  }

  Widget menuItem() {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            InkWell(
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
                      return HomePage();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Ana Sayfa",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                ],
              ),
            ),
            // SizedBox(height: 10),
            // Divider(),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       PageRouteBuilder(
            //         transitionDuration: Duration(seconds: 1),
            //         transitionsBuilder:
            //             (context, animation, animationTime, child) {
            //           animation = CurvedAnimation(
            //             curve: Curves.fastOutSlowIn,
            //             parent: animation,
            //           );
            //           return ScaleTransition(
            //             scale: animation,
            //             child: child,
            //             alignment: Alignment.center,
            //           );
            //         },
            //         pageBuilder: (context, animation, animationTime) {
            //           return CommunicationScreen();
            //         },
            //       ),
            //     );
            //   },
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Icon(
            //           Icons.contact_mail_outlined,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "İletişim",
            //           style: TextStyle(
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       Icon(Icons.arrow_forward_ios_sharp),
            //       SizedBox(width: 10),
            //     ],
            //   ),
            // ),
            SizedBox(height: 10),
            Divider(),
            InkWell(
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
                      return OtherAppScreen();
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.apps_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Diğer Uygulamlarımız",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            InkWell(
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
                      return CommentAppScreen();
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.comment_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Uygulamayı Yorumla",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            InkWell(
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
                      return RateAppScreen();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.star_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Uygulamayı Puanla",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            InkWell(
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
                      return AppInfo();
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.perm_device_info_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Uygulamamız Hakkında ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            InkWell(
              onTap: () => exit(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Çıkış",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 10),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }
}
