import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_project/screens/maps_screen/maps_screen.dart';
import 'package:water_project/screens/projects_screen/proeject_screen.dart';

import '../../screens/auth_screens/login_screen.dart';
import '../../screens/details_screen/components/custom_menu_item.dart';
import '../../screens/details_screen/details_screen.dart';
import '../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      elevation: 20,
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
          const SizedBox(
            height: kDefaultPadding2x * 3,
          ),
          CustomMenuItem(
              title: "Your Projects",
              svgSrc: "assets/svg/map_view.svg",
              onPressed: () {
                Navigator.pushNamed(context, DetailsScreen.id);
              }),
          CustomMenuItem(
              title: "Map View",
              svgSrc: "assets/svg/map_view.svg",
              onPressed: () {
                Navigator.pushNamed(context, DetailsScreen.id);
              }),
          CustomMenuItem(
              title: "List View",
              svgSrc: "assets/svg/list_view.svg",
              onPressed: () {
                Navigator.pushNamed(context, DetailsScreen.id);
              }),
          CustomMenuItem(
              isSelected: true,
              title: "Details",
              svgSrc: "assets/svg/details_outline_icon.svg",
              onPressed: () {
                Navigator.pushNamed(context, DetailsScreen.id);
              }),
        ],
      ),
    );
  }
}

void selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DetailsScreen()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DetailsScreen()),
      );
  }
}

class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("field");
  }
}

class NavigationRailDrawer extends StatefulWidget {
  static const String id = "Navigation_Rail_Drawer";
  const NavigationRailDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationRailDrawer> createState() => _NavigationRailDrawerState();
}

class _NavigationRailDrawerState extends State<NavigationRailDrawer> {
  bool isExpanded = true;

  final List<Widget> pages = const [
    MapsScreen(
      key: PageStorageKey(MapsScreen.id),
    ),
    DetailsScreen(
      key: PageStorageKey(DetailsScreen.id),
    ),
    ProjectScreen(
      key: PageStorageKey(ProjectScreen.id),
    ),
    LoginScreen(
      key: PageStorageKey(LoginScreen.id),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // setState(() {
    //   screenSize.width < 300 ? isExpanded = false : isExpanded = true;
    // });
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: Row(
          children: [
            SideMenu(),
            NavigationRail(
              extended: true,

              ///If the rail is expanded, then show the labels, if not, then don't show the labels.
              destinations: [
                NavigationRailDestination(
                  icon: SvgPicture.asset(""),
                  label: const Text("Projects"),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(""),
                  label: const Text("Details"),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(""),
                  label: const Text("Maps"),
                ),
              ],
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
            ),
            pages[_selectedIndex],
          ],
        ),
      ),
    );
  }
}
