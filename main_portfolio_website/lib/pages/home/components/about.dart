import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/models/technology.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

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
                Consumer(
                  builder: (context, ref, child) => Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Me",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            "I'm Mansur Sarkhanov, A Android and IOS Developer",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "I study at Azerbaijan State Oil and Industry university .My occupation is Mechatronics and Robotics engineering and I am third course.I started to learn Flutter 2 years ago. ",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Technology I have worked with",
                            style: GoogleFonts.josefinSans(
                              color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse,
                              },
                            ),
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: TechnologyConstants.technologyLearned
                                    .map(
                                      (e) => MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ref.watch(themeProvider).isDarkMode
                                                  ? lightPrimaryColor
                                                  : darkPrimaryColor,
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            margin: const EdgeInsets.symmetric(horizontal: 5),
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                                            child: InkWell(
                                              onTap: e.onPressed,
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 20, height: 20, child: Image.asset(e.logo)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      e.name,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                if (ScreenHelper.isDesktop(context) || ScreenHelper.isTablet(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/iam_2.jpeg')),
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
