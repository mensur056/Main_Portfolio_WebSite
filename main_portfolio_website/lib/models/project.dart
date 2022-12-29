import 'package:main_portfolio_website/models/link.dart';
import 'package:main_portfolio_website/models/technology.dart';
import 'package:main_portfolio_website/utils/constants.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String appPhotos;
  final String projectLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter App",
      title: "E Commerce",
      description:
          "This is a shopping aplication , but this app is clone .If you wanna see code of this app you can click . ",
      appPhotos: "assets/images/projectimage/commerce.png",
      projectLink: "https://github.com/mensur056/E-Commerce-App/tree/main/ecommerce",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
        TechnologyConstants.dart,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Instagram Clone",
      description: "That is instagram clone .I could not finish",
      appPhotos: "assets/images/projectimage/instagram.png",
      projectLink: "https://github.com/mensur056/Instagram/tree/main/instagram",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.nodejs,
        TechnologyConstants.dart,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Recycle",
      description: "This application is very important for everyone because, we need recycle .",
      appPhotos: "assets/images/projectimage/recycle.png",
      projectLink: "https://github.com/mensur056/Recycle/tree/main/recycle",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "To Do",
      description: "This is my first app on Flutter. If you wanna write your daily rutine you can use that",
      appPhotos: "assets/images/projectimage/todo.png",
      projectLink: "https://github.com/spectr-flutter/To_Do_List",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Wallpaper",
      description: "This is a simple app. if you can use the wallpaper you can use thaht",
      appPhotos: "assets/images/projectimage/wallpaper.png",
      projectLink: "https://github.com/spectr-flutter/pixabay",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.git,
        TechnologyConstants.java,
      ],
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/AgnelSelvan/Flutter-Web-Portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
}
