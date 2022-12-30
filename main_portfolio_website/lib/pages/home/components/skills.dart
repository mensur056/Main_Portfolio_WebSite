import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/models/skill.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

List<Skill> skills = [
  Skill(skill: "Dart", percentage: 80, image: 'assets/images/technology/dart.png'),
  Skill(skill: "Flutter", percentage: 90, image: 'assets/images/technology/flutter.png'),
  Skill(skill: "Firebase", percentage: 75, image: 'assets/images/technology/firebase.png'),
  Skill(skill: "Python", percentage: 64, image: 'assets/images/technology/python.png'),
  Skill(skill: "Git", percentage: 60, image: 'assets/images/technology/git.png'),
  Skill(skill: "Node Js", percentage: 50, image: 'assets/images/technology/nodejs.png'),
];

class SkillSection extends StatefulWidget {
  const SkillSection({Key? key}) : super(key: key);

  @override
  State<SkillSection> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  List<Color> lightColor = [
    const Color.fromARGB(255, 68, 214, 97),
    const Color.fromARGB(255, 18, 121, 7),
  ];
  List<Color> darkColor = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
  ];

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 3 : 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      "assets/images/iam_3.jpg",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Expanded(
                      flex: constraints.maxWidth > 720.0 ? 4 : 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "This is all the skills listed below more will be added in due time. This is all the skills listed below more will be added in due time.",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: skills
                                .map(
                                  (skill) => Container(
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            alignment: Alignment.centerLeft,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                              colors: ref.watch(themeProvider).isDarkMode ? darkColor : lightColor,
                                            )),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  skill.image,
                                                  width: 24,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  skill.skill,
                                                  style:
                                                      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          // remaining (blank part)
                                          flex: 100 - skill.percentage,
                                          child: Divider(
                                            color:
                                                ref.watch(themeProvider).isDarkMode ? Colors.white : darkPrimaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "${skill.percentage}%",
                                          style: TextStyle(
                                            color:
                                                ref.watch(themeProvider).isDarkMode ? Colors.white : darkPrimaryColor,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
