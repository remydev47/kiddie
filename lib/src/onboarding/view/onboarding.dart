import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:kiddie/common/utils/kcolors.dart';
import 'package:kiddie/controllers/onboarding_notifier.dart';
import 'package:kiddie/src/onboarding/widgets/onboarding1.dart';
import 'package:kiddie/src/onboarding/widgets/onborading2.dart';
import 'package:kiddie/src/onboarding/widgets/welcomescreen.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(
        initialPage: context.read<OnboardingNotifier>().selectedPage);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              context.read<OnboardingNotifier>().setSelectedPage = page;
            },
            children: [
              OnboardingScreen1(),
              Onboarding2(),
              Welcomescreen(),
            ],
          ),
          context.watch<OnboardingNotifier>().selectedPage == 2
              ? SizedBox.shrink()
              : Positioned(
                  bottom: 50.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        context.watch<OnboardingNotifier>().selectedPage == 0
                            ? SizedBox(
                                width: 25,
                              )
                            : GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(
                                    context
                                            .read<OnboardingNotifier>()
                                            .selectedPage -
                                        1,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Icon(
                                  AntDesign.leftcircleo,
                                  color: Kolors.kPrimary,
                                  size: 30,
                                ),
                              ),
                        SizedBox(
                          width: ScreenUtil().screenWidth * 0.7,
                          height: 50.h,
                          child: PageViewDotIndicator(
                            currentItem: context
                                .watch<OnboardingNotifier>()
                                .selectedPage,
                            count: 3,
                            unselectedColor: Colors.black26,
                            selectedColor: Kolors.kPrimary,
                            duration: const Duration(milliseconds: 200),
                            onItemClicked: (index) {
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              context.read<OnboardingNotifier>().selectedPage +
                                  1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Icon(
                            AntDesign.rightcircleo,
                            color: Kolors.kPrimary,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
