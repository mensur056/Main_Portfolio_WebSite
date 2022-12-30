import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/models/project.dart';
import 'package:main_portfolio_website/pages/home/components/about.dart';
import 'package:main_portfolio_website/pages/home/components/carousel.dart';
import 'package:main_portfolio_website/pages/home/components/footer.dart';
import 'package:main_portfolio_website/pages/home/components/header.dart';
import 'package:main_portfolio_website/pages/home/components/portfolio_stats.dart';
import 'package:main_portfolio_website/pages/home/components/project.dart';
import 'package:main_portfolio_website/pages/home/components/service.dart';
import 'package:main_portfolio_website/pages/home/components/skills.dart';
import 'package:main_portfolio_website/provider/home.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/globals.dart';
import 'package:main_portfolio_website/utils/screen_helper.dart';
import 'package:main_portfolio_website/widgets/switch.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                Carousel(
                  key: _homeProvider.homeKey,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SocialMediaIcons(),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  key: _homeProvider.aboutKey,
                  height: 100,
                ),
                const AboutSection(),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  key: _homeProvider.skillKey,
                  height: 100,
                ),
                _skillsSection(),
                const SizedBox(
                  height: 24,
                ),
                const SkillSection(),
                const SizedBox(
                  height: 50,
                ),
                ServiceSection(
                  key: _homeProvider.servicesKey,
                ),
                SizedBox(
                  key: _homeProvider.portfolioKey,
                  height: 100.0,
                ),
                _portfolioTextSection(),
                ProjectSection(
                  projects: ProjectModel.projects,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 28.0),
                  child: PortfolioStats(),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Footer(
                  key: _homeProvider.contactKey,
                )
              ],
            ),
          ),
        ),
        Header(
          themeSwitch: ThemeSwitcher(
            clipper: const ThemeSwitcherBoxClipper(),
            builder: (context) {
              return CustomSwitch(
                value: ref.watch(themeProvider).isDarkMode,
                onChanged: (val) {
                  ref.read(themeProvider).changeTheme(val);
                  ThemeSwitcher.of(context)
                      .changeTheme(theme: ref.read(themeProvider).getCurrentTheme, isReversed: false // default: false
                          );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Center _skillsSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Skills",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "I knowledge and My interests :)",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Center _portfolioTextSection() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Portfolio",
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w900,
            fontSize: 36,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Here are some of my Previous Work :)",
          style: GoogleFonts.josefinSans(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    if (Globals.scaffoldKey.currentState != null) {
                      if (Globals.scaffoldKey.currentState!.isEndDrawerOpen) {
                        Navigator.pop(context);
                        _homeProvider.scrollBasedOnHeader(HeaderRow.headerItems[index]);
                      }
                    }
                  },
                  leading: Icon(
                    HeaderRow.headerItems[index].iconData,
                  ),
                  title: Text(
                    HeaderRow.headerItems[index].title,
                    style: const TextStyle(),
                  ),
                  trailing: HeaderRow.headerItems[index].isDarkTheme != null
                      ? HeaderRow.headerItems[index].isDarkTheme!
                          ? SizedBox(
                              width: 50,
                              child: CustomSwitch(
                                value: ref.watch(themeProvider).isDarkMode,
                                onChanged: (val) {
                                  ref.read(themeProvider).changeTheme(val);
                                  ThemeSwitcher.of(context).changeTheme(
                                      theme: ref.read(themeProvider).getCurrentTheme,
                                      isReversed: false // default: false
                                      );
                                },
                              ),
                            )
                          : null
                      : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: HeaderRow.headerItems.length,
            ),
          ),
        ),
      ),
      body: _buildPage(),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AppConstants.socialLoginDatas
              .map(
                (e) => InkWell(
                  onTap: e.onTap,
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      e.title,
                      color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
