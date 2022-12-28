import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/utils.dart';

class TechnologyModel {
  final String name;
  final String logo;
  final Function() onPressed;

  TechnologyModel(this.name, this.logo, this.onPressed);
}

class TechnologyConstants {
  static TechnologyModel python = TechnologyModel(
    "Python",
    AppConstants.pythonImage,
    () => Utilty.openUrl('https://www.python.org/'),
  );
  static TechnologyModel flutter = TechnologyModel(
    "Flutter",
    AppConstants.flutterImage,
    () => Utilty.openUrl('https://flutter.dev/'),
  );
  static TechnologyModel nodejs = TechnologyModel(
    "NodeJs",
    AppConstants.nodejsImage,
    () => Utilty.openUrl('https://nodejs.org/en/'),
  );
  static TechnologyModel firebase = TechnologyModel(
    "Firebase",
    AppConstants.firebaseImage,
    () => Utilty.openUrl('https://firebase.google.com/'),
  );
  static TechnologyModel arduino = TechnologyModel(
    "Arduino",
    AppConstants.arduinoImage,
    () => Utilty.openUrl('https://www.arduino.cc/'),
  );
  static TechnologyModel cPlus = TechnologyModel(
    "C++",
    AppConstants.cPlusImage,
    () => Utilty.openUrl('https://cplusplus.com/'),
  );
  static TechnologyModel dart = TechnologyModel(
    "Dart",
    AppConstants.dartImage,
    () => Utilty.openUrl('https://dart.dev/'),
  );
  static TechnologyModel java = TechnologyModel(
    "Java",
    AppConstants.javaImage,
    () => Utilty.openUrl('https://www.java.com/en/'),
  );
  static TechnologyModel git = TechnologyModel(
    "Git",
    AppConstants.gitImage,
    () => Utilty.openUrl('https://git-scm.com/'),
  );
  static TechnologyModel figma = TechnologyModel(
    "Figma",
    AppConstants.figmaImage,
    () => Utilty.openUrl('https://www.figma.com/'),
  );

  static List<TechnologyModel> technologyLearned = [
    flutter,
    java,
    cPlus,
    python,
    git,
    figma,
    dart,
    arduino,
    nodejs,
    firebase
  ];
}
