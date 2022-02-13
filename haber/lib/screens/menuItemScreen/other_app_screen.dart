import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherAppScreen extends StatelessWidget {
  const OtherAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Column(
          children: [
            Text(
              "DİĞER UYGULAMALAR",
              style: GoogleFonts.oswald(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Image.network(
                    "https://play-lh.googleusercontent.com/JJiK7DCgoIubkjTCRmYai3bQqPUFop8sUrVqgsSrb8nJfFCBYmlZ9CrqWw1T-JnYu7Q=s180-rw",
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kargo Takip Uygulaması",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          openUrl(
                              "https://play.google.com/store/apps/details?id=org.mfs.takip_kargo&gl=TR");
                        },
                        child: Text(
                          "Google Playde Aç",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
               width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Image.network(
                    "https://play-lh.googleusercontent.com/GlNdDLj2sWw4_Q_QC2fgdB2eZB183Pt0uBg4gBqxNPYhLt_XCmL5SXOEvbk9_uZQdH8h=s180-rw",
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yemek Tarifleri Uygulaması",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          openUrl(
                              "https://play.google.com/store/apps/details?id=org.mfs.yeni_uygulama&gl=TR");
                        },
                        child: Text(
                          "Google Playde Aç",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
               width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Image.network(
                    "https://play-lh.googleusercontent.com/xdvz7X_r7PlCRy_xD6278ECJnxpmq380_XuQ06pVyr9KcX6NJvLmJV-wrFwibhO3VZw=s180-rw",
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "QR Kod Okuyucu",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          openUrl(
                              "https://play.google.com/store/apps/details?id=com.mfs.qr_kod_reader&gl=TR");
                        },
                        child: Text(
                          "Google Playde Aç",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(

               width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Image.network(
                    "https://play-lh.googleusercontent.com/_pymLAoTZ2-qQkmhUgPcCNOgdUhYYrdtZ2qwKdPc5bCaJlXdEdl982uSjk9COmzpfDBX=s180-rw",
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To-Do ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          openUrl(
                              "https://play.google.com/store/apps/details?id=com.mfs.todos&gl=TR");
                        },
                        child: Text(
                          "Google Playde Aç",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
               width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Image.network(
                    "https://play-lh.googleusercontent.com/K6Q1BM5yskF-lJQdiKMarVKPR4afbKCOsdyNbbkYLJ6m3zjYyOUvn28tEEmqXIBb2bU=s180-rw",
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flapy",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          openUrl(
                              "https://play.google.com/store/apps/details?id=org.mfs.first_my_game&gl=TR");
                        },
                        child: Text(
                          "Google Playde Aç",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void openUrl(String url) async {
    await launch(url);
  }
}
