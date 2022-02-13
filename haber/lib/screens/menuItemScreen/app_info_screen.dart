import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

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
              "UYGULAMA HAKKINDA",
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Daha Yeni yayınlaşmış olan uygulamamızın içeriği güncel haberleri sizlere ulaştırmaktır.Bizim için önemli olan sizlere en güncel haberleri göstermektir. Aynı zamanda yabancı haberleri de göstermektedir (isteğe bağlı olarak). Haberler API üzerinden gelmektedir.Uygulamamız hala geliştirmelere açık olup geliştirilmeye devam etmektedir.Eğer Uygulamamızda bir eksik veya hata görürseniz bize mail yolu ile ulaşıp bildirebilirsiniz.Uygulamamızı Google Play'de uygulamamıza yorum yapıp yıldız vermeyi Unutmayın.",
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
