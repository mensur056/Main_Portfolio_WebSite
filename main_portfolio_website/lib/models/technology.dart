import 'package:main_portfolio_website/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python = TechnologyModel("Python", AppConstants.pythonImage);
  static TechnologyModel flutter = TechnologyModel("Flutter", AppConstants.flutterImage);
  static TechnologyModel nodejs = TechnologyModel("NodeJs", AppConstants.nodejsImage);
  static TechnologyModel firebase = TechnologyModel("Firebase", AppConstants.firebaseImage);
  static TechnologyModel arduino = TechnologyModel("Arduino", AppConstants.arduinoImage);
  static TechnologyModel cPlus = TechnologyModel("C++", AppConstants.cPlusImage);
  static TechnologyModel dart = TechnologyModel("Dart", AppConstants.dartImage);
  static TechnologyModel java = TechnologyModel("Java", AppConstants.javaImage);
  static TechnologyModel git = TechnologyModel("Git", AppConstants.gitImage);
  static TechnologyModel figma = TechnologyModel("Figma", AppConstants.figmaImage);

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
