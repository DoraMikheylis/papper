import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_file/models/nav_item.dart';
import '../constants.dart';
import '../size_config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3), //30
        // just for demo
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 30,
              color: Color(0xFF4B1A39).withOpacity(0.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.items.length,
              (index) {
                bool isCurrentRoute = false;
                Navigator.popUntil(context, (route) {
                  if (navItems.items[index].destination ==
                      route.settings.name) {
                    isCurrentRoute = true;
                  }
                  return true;
                });
                return buildIconNavBarItem(
                  isActive: isCurrentRoute,
                  icon: navItems.items[index].icon,
                  press: () {
                    navItems.chnageNavIndex(index: index);
                    // maybe destinationChacker is not needed in future because then all of our nav items have destination
                    // But Now if we click those which dont have destination then it shows error
                    // And this fix this problem
                    if (navItems.items[index].destinationChecker())
                      Navigator.pushNamed(
                        context,
                        navItems.items[index].destination,
                      );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBarItem(
      {IconData icon, Function press, bool isActive = false}) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: isActive ? kPrimaryColor : Colors.grey,
      ),
      onPressed: press,
    );
  }
}
