import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:haber/constant.dart';
import 'package:haber/screens/home_screen.dart';
import 'package:haber/screens/other_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

// the flutter  news app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      theme: ThemeData(
        // ignore: deprecated_member_use
        accentColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentIndex = 0;
  static const List<Widget> screenList = [
    HomePage(),
    OtherScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      // ),
    );
  }
}
