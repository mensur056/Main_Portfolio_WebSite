import 'package:flutter/material.dart';
import 'package:main_portfolio_website/models/header_item.dart';
import 'package:main_portfolio_website/utils/utils.dart';

const Color darkPrimaryColor = Color.fromARGB(255, 36, 123, 17);
Color? lightPrimaryColor = const Color(0xFFe5a647);

const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) => MediaQuery.of(context).size.width * .8;

class AppConstants {
  static const linkedInUrl = "https://www.linkedin.com/in/mansur-sarxanov-b61606226/";
  static const instagramUrl = "https://www.instagram.com/m3nsur_7/";
  static const githubUrl = "https://github.com/mensur056";
  static const mediumUrl = "https://medium.com/@mansur.sarxanov";

  static const _assets = "assets/";
  static const _outputs = "outputs/";

  static const _svg = "${_assets}svg/";
  static const guySvg = "${_svg}guy.svg";
  static const personSvg = "${_svg}person.svg";

  static const _images = "${_assets}images/";

  static const _socialImages = "${_images}social/";
  static const emailImage = "${_socialImages}email.png";
  static const linkedInImage = "${_socialImages}linkedin-logo.png";
  static const instaImage = "${_socialImages}instagram.png";
  static const githubImage = "${_socialImages}github.png";
  static const mediumImage = "${_socialImages}medium.png";

  static const _techImages = "assets/images/technology/";
  static const flutterImage = "${_techImages}flutter.png";
  static const pythonImage = "${_techImages}python.png";
  static const firebaseImage = "${_techImages}firebase.png";
  static const cPlusImage = "${_techImages}c++.png";
  static const javaImage = "${_techImages}java.png";
  static const nodejsImage = "${_techImages}nodejs.png";
  static const figmaImage = "${_techImages}figma.png";
  static const gitImage = "${_techImages}git.png";
  static const dartImage = "${_techImages}dart.png";
  static const arduinoImage = "${_techImages}arduino.png";

  static const _projectsImages = "${_images}projects/";
  static const smartStoreImage = "${_projectsImages}1.jpeg";
  static const crossTheRoadImage = "${_projectsImages}2.jpeg";
  static const newsUpImage = "${_projectsImages}3.jpeg";
  static const musicLabImage = "${_projectsImages}4.jpeg";
  static const personalFaceImage = "${_projectsImages}5.jpeg";
  static const computerStoreImage = "${_projectsImages}6.jpeg";

  static const _gifs = "${_outputs}gif/";
  static const portfolioGif = "${_gifs}mobile.gif";

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: linkedInImage,
        onTap: () {
          Utilty.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: instaImage,
        onTap: () {
          Utilty.openUrl(instagramUrl);
        }),
    NameOnTap(
        title: githubImage,
        onTap: () {
          Utilty.openUrl(githubUrl);
        }),
    NameOnTap(
        title: mediumImage,
        onTap: () {
          Utilty.openUrl(mediumUrl);
        }),
  ];
}
