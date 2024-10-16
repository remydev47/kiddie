
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kiddie/common/services/storage.dart';
import 'package:kiddie/common/utils/kcolors.dart';
import 'package:kiddie/constants/resource.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(Duration(milliseconds: 3000), () {
      if (Storage().getBool('firstOpen') == null) {
        GoRouter.of(context).go('/onboarding');
      } else {
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kolors.kPrimaryLight,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG))),
        ));
  }
}
