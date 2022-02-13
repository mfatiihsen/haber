import 'dart:io';

class AdService {
  static String get detailBannerAdUnitIdTwo {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4365766653931652/2709516752';
    } else {
      throw new UnsupportedError("Reklam Yüklenemedi");
    }
  }

  static String get detailBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4365766653931652/3157289066';
    } else {
      throw new UnsupportedError("Reklam Yüklenemedi");
    }
  }

  static String get homeBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4365766653931652/3432485189';
    } else {
      throw new UnsupportedError("Reklam Yüklenemedi :(");
    }
  }
}
