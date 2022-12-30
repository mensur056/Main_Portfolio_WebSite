import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_portfolio_website/provider/theme.dart';
import 'package:main_portfolio_website/utils/constants.dart';
import 'package:main_portfolio_website/utils/utils.dart';
import '../../../models/carousel_item_model.dart';

List<CarouselItemModel> carouselItems(double carouselContainerHeight) => List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Text(
                    "Mobile Application Developer",
                    style: GoogleFonts.josefinSans(
                      color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                      letterSpacing: 2,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                "Mansur Sarkhanov".toUpperCase(),
                style: GoogleFonts.josefinSans(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                  letterSpacing: 2.3,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Text(
                    "Software Engineer, ",
                    style: TextStyle(
                      color: kCaptionColor,
                      fontSize: 15.0,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    color: kCaptionColor,
                    size: 14,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Azerbaijan",
                    style: TextStyle(
                      color: kCaptionColor,
                      fontSize: 15.0,
                      height: 1.0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ref.watch(themeProvider).isDarkMode ? lightPrimaryColor : darkPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28.0,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Utilty.openUrl(AppConstants.linkedInUrl);
                        },
                        child: Text(
                          "Let's Talk",
                          style: TextStyle(
                            color: ref.read(themeProvider).isDarkMode ? kBackgroundColor : Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        image: SizedBox(
          height: carouselContainerHeight,
          child: Image.asset('assets/images/iam_4.png'),
        ),
      ),
    );
