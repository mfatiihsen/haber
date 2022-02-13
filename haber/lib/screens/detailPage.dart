import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:haber/constant.dart';
import 'package:haber/model/artide_models.dart';
import 'package:haber/services/advert_service.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.article});
  final Article article;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
// reklam değişkeninin atanması
  BannerAd? _ad;
  BannerAd? _ad2;
  bool? isLoaded;

  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
        size: AdSize.banner,
        adUnitId: AdService.detailBannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(
            () {
              isLoaded = true;
            },
          );
        }, onAdFailedToLoad: (_, error) {
          print("Ad Failed to Load with error : $error");
        }),
        request: AdRequest());
    _ad!.load();
    _ad2 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdService.detailBannerAdUnitIdTwo,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (_, error) {
          print("Ad Failed to Loaded with error : $error");
        },
      ),
      request: AdRequest(),
    );
    _ad2!.load();
  }

  // reklamların olduğu widget
  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        height: 100,
        child: AdWidget(
          ad: _ad!,
        ),
        width: _ad!.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
  }

  // reklamların olduğu widget
  Widget checkForAd2() {
    if (isLoaded == true) {
      return Container(
        height: 100,
        child: AdWidget(
          ad: _ad2!,
        ),
        width: _ad2!.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.article.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 0,
                        right: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(
                          0.5,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 0,
                        right: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(
                          0.5,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          shareUrl();
                        },
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    widget.article.title,
                    style: TextStyle(
                        fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  // hbaer yazarının ve haberin yayınlanma zamanı 'nı gösteren widget
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://img.icons8.com/external-flatart-icons-outline-flatarticons/64/000000/external-person-corporate-development-and-business-management-flatart-icons-outline-flatarticons.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.article.author,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.article.publishedAt,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.article.description,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  // Bağlantıyı aç butonu
                  Container(
                    width: double.infinity,

                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      onPressed: () {
                        openUrl();
                        print("Open Button Clicked");
                      },
                      child: Text(
                        "Bağlantıyı Aç",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // reklam
                  checkForAd(),
                  SizedBox(height: 0),
                  Text(
                    widget.article.content,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  // reklam
                  checkForAd2(),
                  SizedBox(height: 10),
                  // en alttaki mfs software yazısı
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                    ),
                    child: Center(
                      child: Text(
                        "MFS SOFTWARE © 2021",
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // bağlantının açılması için yazılan operasyon
  void openUrl() async {
    String url = widget.article.url;
    await launch(url);
  }

  // paylaş ekranının açılması için gereken operasyon
  void shareUrl() {
    Share.share(widget.article.url);
  }
}
