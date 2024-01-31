import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:water_project/screens/home/home_screen.dart';
import 'package:water_project/screens/maps/maps_screen.dart';
import 'package:water_project/screens/projects/sensor_details_screen.dart';

class NavRailScreen extends StatefulWidget {
  static const id = "nav rail screen";
  const NavRailScreen({super.key});

  @override
  State<NavRailScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavRailScreen> {
  int selectedPageIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> pages = [
    const HomeScreen(
      key: PageStorageKey(HomeScreen.id),
    ),
    const MapsScreen(
      key: PageStorageKey(MapsScreen.id),
    ),
    const SensorDetailsScreen(
      key: PageStorageKey(SensorDetailsScreen.id),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width: 1, color: Theme.of(context).cardColor))
            ),
            child: NavigationRail(
              leading: const SizedBox(
                height: 32,
              ),

              minExtendedWidth: 200,
              selectedIconTheme: Theme.of(context)
                  .iconTheme
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              unselectedLabelTextStyle: Theme.of(context).textTheme.bodyMedium,
              selectedLabelTextStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              extended: MediaQuery.sizeOf(context).width > 850 ? true : false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
              selectedIndex: selectedPageIndex,
              indicatorColor: Theme.of(context).cardColor,
              // indicatorShape: ContinuousRectangleBorder(
              //     borderRadius: BorderRadius.circular(16)),
              destinations: const [
                NavigationRailDestination(
                    selectedIcon: Icon(FluentIcons.list_24_filled),
                    icon: Icon(FluentIcons.list_24_regular),
                    label: Text("Your Projects"),),
                NavigationRailDestination(
                    selectedIcon: Icon(FluentIcons.map_24_filled),
                    icon: Icon(FluentIcons.map_24_regular),
                    label: Text("Map Overview"),),
                NavigationRailDestination(
                    selectedIcon: Icon(FluentIcons.apps_list_detail_24_filled),
                    icon: Icon(FluentIcons.apps_list_detail_24_regular),
                    label: Text("Sensor Details"),),
              ],
            ),
          ),
          Expanded(
            child: PageStorage(bucket: bucket, child: pages[selectedPageIndex]),
          ),
        ],
      ),
    );
  }
}
