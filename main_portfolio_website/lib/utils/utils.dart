import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:mansur.sarxanov@gmail.com");

  static Future<void> openMyLocation() => openUrl(
      "https://www.google.com/maps/place/40%C2%B022'36.3%22N+49%C2%B049'59.4%22E/@40.37675,49.8331667,17z/data=!3m1!4b1!4m6!3m5!1s0x0:0xb95c71214f675495!7e2!8m2!3d40.3767556!4d49.8331667");
  static Future<void> openMyPhoneNo() => openUrl("tel:+994-50-645-2939");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/994506452939");
}
