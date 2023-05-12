import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:water_project/screens/details_screen/components/flow_rate_per_project.dart';
import 'package:water_project/screens/details_screen/components/number_of_projects_data.dart';
import 'package:water_project/screens/details_screen/components/project_status.dart';

import '../../core/core.dart';

class ProjectScreen extends StatefulWidget {
  static const id = "project screen";
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  ///Testing line chart data
  LineChartData get sampleLineChartData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );

  // LineChartData get sampleData2 => LineChartData(
  //       lineTouchData: lineTouchData2,
  //       gridData: gridData,
  //       titlesData: titlesData2,
  //       borderData: borderData,
  //       lineBarsData: lineBarsData2,
  //       minX: 0,
  //       maxX: 14,
  //       maxY: 6,
  //       minY: 0,
  //     );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(kDefaultPadding),
          tooltipBgColor: kPurple,
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        // lineChartBarData1_2,
        // lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 14, color: kDark60);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('00:00', style: style);
        break;
      case 2:
        text = const Text(
          '06:00',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          '12:00',
          style: style,
        );
        break;
      default:
        text = const Text('18:00');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        // getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData gridData = FlGridData(
      drawVerticalLine: false,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          strokeWidth: 1,
          color: kPurple20,
        );
      },
      show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: kDark60, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: kPurple,
        barWidth: 6,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                colors: [kPurple20, Colors.white.withOpacity(0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        spots: const [
          FlSpot(0, 2),
          FlSpot(3, 2.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 3,
            child: NavigationRailDrawer(),
          ),
          const SizedBox(width: kDefaultPadding2x),
          Expanded(
            flex: 13,
            child: ListView(
              children: [
                const SizedBox(
                  height: kDefaultPadding2x,
                ),
                const Align(alignment: Alignment.centerRight, child: Header()),
                Text(
                  "At a Glance",
                  style: theme.textTheme.displayLarge!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: kDefaultPadding * 3,
                ),
                SizedBox(
                  height: 190,
                  width: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        NumberOfProjects(isNormal: true),
                        SizedBox(width: kDefaultPadding2x),
                        FlowRatePerProject(isNormal: true),
                        SizedBox(width: kDefaultPadding2x),
                        // const SensorMetaData(),
                        ProjectStatus(isNormal: true),
                        SizedBox(width: kDefaultPadding2x),

                        ///Current Flow Rate
                        // DisplayFlowRate(),
                        SizedBox(
                          width: kDefaultPadding2x,
                        ),

                        ///Normal or Abnormal
                        // const FlowStatus(
                        //   isNormal: true,
                        // ),
                        SizedBox(width: kDefaultPadding2x),
                        // CustomButton(
                        //   onPressed: () {},
                        //   text: "Locate On Map",
                        //   showIcon: true,
                        //   iconLink: "assets/svg/map_pin.svg",
                        // )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding2x),
                Text(
                  "Your Projects",
                  style: theme.textTheme.displayLarge!
                      .copyWith(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 370),
                  child: CustomCard(
                    bgColor: Colors.white,
                    shadowColor: kPurple20,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 384,
                              height: 160,

                              // alignment: Alignment.bottomLeft,

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: rectanglecolor,
                                  borderRadius: BorderRadius.circular(20)),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 250, top: 5),
                                    child: Text(
                                      "Project Name",
                                      style: theme.textTheme.displayLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black87),
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 60),
                                    child: Text(
                                      "Projects fgfgfgfgffgfhfghgfnghngnghythyuyu",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 150, bottom: 4),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text("view project"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding),
                            Container(
                              width: 384,
                              height: 160,

                              // alignment: Alignment.bottomLeft,

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: rectanglecolor,
                                  borderRadius: BorderRadius.circular(20)),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 250, top: 5),
                                    child: Text(
                                      "Project Name",
                                      style: theme.textTheme.displayLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black87),
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 60),
                                    child: Text(
                                      "Projects fgfgfgfgffgfhfghgfnghngnghythyuyu",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 150, bottom: 4),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text("view project"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding2x),
                        Row(
                          children: [
                            Container(
                              width: 384,
                              height: 160,

                              // alignment: Alignment.bottomLeft,

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: rectanglecolor,
                                  borderRadius: BorderRadius.circular(20)),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 250, top: 5),
                                    child: Text(
                                      "Project Name",
                                      style: theme.textTheme.displayLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black87),
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 60),
                                    child: Text(
                                      "Projects fgfgfgfgffgfhfghgfnghngnghythyuyu",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 150, bottom: 4),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text("view project"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SizedBox(
              height: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool onSelected;
  final String title;
  const CategoryItem({
    Key? key,
    this.onSelected = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding2x),
        color: onSelected ? theme.primaryColor : theme.cardColor,
      ),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium!
            .copyWith(color: onSelected ? Colors.white : theme.iconTheme.color),
      ),
    );
  }
}
