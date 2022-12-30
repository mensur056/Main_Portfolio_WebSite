import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/models/name_color.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/design_process.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Learn",
    imagePath: "assets/images/learn.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/develop.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Document It",
    imagePath: "assets/images/blog.png",
    subtitle: "",
  ),
];

class ServiceSection extends StatelessWidget {
  ServiceSection({Key? key}) : super(key: key);
  final whatIDo = [
    NameIconColor(
      title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
    ),
    NameIconColor(
      title: "Web Development",
      iconData: Icons.web,
      color: Colors.yellow[400]!,
    ),
    NameIconColor(
      title: "Technical Blog Writer",
      iconData: Icons.article,
      color: Colors.blue[400]!,
    ),
    NameIconColor(
      title: "Github Open Source",
      iconData: Icons.code,
      color: Colors.orange[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Productive ,\n   Experienced",
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  letterSpacing: 2,
                  fontSize: 18.0,
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () {
                      Utilty.openUrl(
                          "https://docmansursarkhanov56.s3.us-east-1.amazonaws.com/Mansur-Sarkhanov.pdf?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECgaCmV1LW5vcnRoLTEiRzBFAiEA6rmzF3QhnJmjrD2l3U01iwtUfzaH9V04JBO2Vr2bbkoCIA8CIfhCqQuvk1LSBNU9cR%2BrE1%2B%2FBSetAIFqj7ELjR68KuQCCHEQABoMMDY4NzQ4MjM2MzQ0IgyCQGPRmGoCxOzTfgwqwQLtgxK3pPNw7oh5A7i7pH4kPTYf2EfshLDFYauhnuqGGr65ltI9i9RqDOdoWKPoK24lKhG2vAhTaN9XWYiwx15gZrj5hdjj9khb5clLxs1GiSAuzoQEq0kT0KBxCm2WyvZPuoFA%2BPAVJN41V7AUS%2BxlndDF4B1kd27D9tKTGVtRyWsapDS2%2FqPVyvrnrIYqQwg%2BsVkBtUu0PWin4jCYwfwMjCy5acWWKfJtGakSWd6j4TM3%2FR1VJnKn4gdulVLdBaL3cX0eMwMmnme2O1U%2Bg14KXWUq4Sp8jJv%2BhLFUMsruf8bQvy6Pm2BLM41tqzgMdzG1ddxCKWCYNXjHg5dYWzanUq21i1BYT5PhveCrNHC2gTmh4upkoVYUEiwF3nH7buQyFVkDslkOlebJLe3fMmgkPkg42cRkap7D7L09uTjEWlwwk626nQY6swIxpXsu07JN6YgHB4v0UY7QoDKKnWDGPe%2FegTVh5PbSdcriskk%2F0HC7nMYCcT%2FegVyPcLO1SCsJpksDMeF1qJowiEG59QtRHWjxrMmRCiwcEblFMD22n7oupUapbeceBOsOaVxwdj1WsixmFc1hwl99Qp9PiX1oYsx7jwik9IcZcCbQCPlZtipw4o8r5G58zjkssGVUbHerTk4%2FGpUZCHCvA6CXPkLVoyCc7lu7hey0KyZ7Jfn9ekiILvRRH1EVYJuXDa4TW5ZkW1zjhOr0tnXHw4SkCf5kUwxNbnrg3F41P8r15zQ2SjrT6LCC9WRPJU1ByMKz4xWn5%2FlRToM%2FUIUPfR63A4tzWVT%2FHM%2FiyuE5MYzlZ3fr0gKU1FF%2BZaOhswT%2BRMyQntBIhJYinHtulnc5Akc5&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221230T075753Z&X-Amz-SignedHeaders=host&X-Amz-Expires=43200&X-Amz-Credential=ASIARAANW2Y4OM5YYZCA%2F20221230%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=dc6aae027df86e3b8be0bea4933cffc8791adf7b90500a3c565d04780e427ad5");
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        "DOWNLOAD CV",
                        style: GoogleFonts.josefinSans(
                          color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            "What I Do?",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "I may not be perfect, but I'm surely of some help",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 100 : 70,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: whatIDo
                    .map((e) => Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ref.watch(themeProvider).isDarkMode
                                ? const Color.fromARGB(75, 12, 12, 7)
                                : Colors.grey[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: ref.watch(themeProvider).isDarkMode ? Colors.grey[900] : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Icon(
                                  e.iconData,
                                  color: e.color,
                                  size: 52,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                  color: ref.watch(themeProvider).isDarkMode ? Colors.grey[400] : Colors.grey[800],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList());
          }),
          const SizedBox(
            height: 80.0,
          ),
          Container(
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 1.0
                        : ScreenHelper.isTablet(context)
                            ? constraints.maxWidth / 2.0
                            : 450.0,
                    childAspectRatio: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Consumer(
                        builder: (context, ref, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    designProcesses[index].imagePath,
                                    color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                                    width: 40.0,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    designProcesses[index].title,
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
