import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/models/footer_item.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/screen_helper.dart';
import 'package:main_portfolio_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconData: Icons.location_on,
      title: "ADDRESS",
      text1: "Baku, Nizami",
      text2: "Azerbaijan",
      onTap: () {
        Utilty.openMyLocation();
      }),
  FooterItem(
      iconData: Icons.phone,
      title: "PHONE",
      text1: "+994-50-645-2939",
      text2: "",
      onTap: () {
        Utilty.openMyPhoneNo();
      }),
  FooterItem(
      iconData: Icons.mail,
      title: "EMAIL",
      text1: "mansur.sarxanov@gmail.com",
      text2: "",
      onTap: () {
        Utilty.openMail();
      }),
  FooterItem(
      iconData: Icons.sms,
      title: "WHATSAPP",
      text1: "+994-50-645-2939",
      text2: "",
      onTap: () {
        Utilty.openWhatsapp();
      })
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: footerItems
                          .map(
                            (footerItem) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: footerItem.onTap,
                                child: SizedBox(
                                  width: ScreenHelper.isMobile(context)
                                      ? constraints.maxWidth / 2.0 - 20.0
                                      : constraints.maxWidth / 4.0 - 20.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            footerItem.iconData,
                                            color: ref.watch(themeProvider).isDarkMode
                                                ? lightPrimaryColor
                                                : darkPrimaryColor,
                                            size: 28,
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            footerItem.title,
                                            style: GoogleFonts.josefinSans(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "${footerItem.text1}\n",
                                              style: const TextStyle(
                                                color: kCaptionColor,
                                                height: 1.8,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${footerItem.text2}\n",
                                              style: const TextStyle(
                                                color: kCaptionColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Developed in 💛 with Flutter",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
