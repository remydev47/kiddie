import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:kiddie/common/utils/kcolors.dart';
import 'package:kiddie/common/widgets/app_style.dart';
import 'package:kiddie/controllers/bottomtabbarnotifier.dart';
import 'package:kiddie/src/communities/views/communities.dart';
import 'package:kiddie/src/doctor/views/doctors.dart';
import 'package:kiddie/src/home/views/home.dart';
import 'package:kiddie/src/market/views/market.dart';
import 'package:kiddie/src/notifications/views/notification.dart';
import 'package:provider/provider.dart';

class Entrypoint extends StatelessWidget {
  Entrypoint({super.key});

  List<Widget> pageList = [
    HomePage(),
    Doctors(),
    Market(),
    Communities(),
    Notifications()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  selectedLabelStyle:
                      appStyle(9, Kolors.kDark, FontWeight.w700),
                  showUnselectedLabels: true,
                  currentIndex: tabIndexNotifier.index,
                  selectedItemColor: Kolors.kIndigo,
                  unselectedIconTheme:
                      const IconThemeData(color: Kolors.kGrayLight),
                  selectedIconTheme:
                      const IconThemeData(color: Kolors.kIndigo),
                  onTap: (i) {
                    tabIndexNotifier.setIndex(i);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.home_filled,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialCommunityIcons.doctor,
                        size: 26,
                      ),
                      label: 'Doctor',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialCommunityIcons.cart,
                        size: 26,
                      ),
                      label: 'Market',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.group,
                        size: 26,
                      ),
                      label: 'Community',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialCommunityIcons.bell,
                        size: 26,
                      ),
                      label: 'Notification',
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
