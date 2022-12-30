import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:main_portfolio_website/models/header_item.dart';
import 'package:main_portfolio_website/provider/home.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/routes/routes.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/globals.dart';
import 'package:main_portfolio_website/utils/screen_helper.dart';
import 'package:main_portfolio_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.initial);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "M ",
                    style: GoogleFonts.josefinSans(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: ref.watch(themeProvider).isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Dev",
                    style: GoogleFonts.josefinSans(
                      color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class HeaderRow extends StatefulWidget {
  const HeaderRow({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "About",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Skills",
          onTap: () {},
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "Portfolio",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Themes",
          onTap: () {
            Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
      ];

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  void changeThemeValue() {}

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(children: [
            ...HeaderRow.headerItems
                .map(
                  (item) => item.title == "Themes"
                      ? const Text("")
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                item.onTap();
                                HomeProvider homeProviderPrivate = ref.read(homeProvider);
                                homeProviderPrivate.scrollBasedOnHeader(item);
                              },
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: item.title == "Blogs" ? darkPrimaryColor : null,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                )
                .toList(),
            // themeSwitch
            InkWell(
              onTap: () {
                _animationController.animateTo(0.5, duration: const Duration(milliseconds: 800));
                ref.read(themeProvider).changeTheme(true);
                if (_animationController.isCompleted) {
                  _animationController.animateTo(0, duration: const Duration(milliseconds: 800));
                  ref.read(themeProvider).changeTheme(false);
                }
              },
              child: LottieBuilder.asset(
                controller: _animationController,
                'assets/images/lotti_themechange.json',
                repeat: false,
              ),
            )
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context, themeSwitch),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context, themeSwitch),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context, Widget themeSwitch) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            HeaderRow(
              themeSwitch: themeSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
