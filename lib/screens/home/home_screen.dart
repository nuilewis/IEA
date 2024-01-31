import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_project/core/constants.dart';
import 'package:water_project/models/models.dart';

import '../widgets/header.dart';
import 'components/add_project_button.dart';
import 'components/project_card.dart';
import 'components/top_card.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Header
                const Gap(16),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Header()),


                Text("At a Glance", style:  Theme.of(context).textTheme.headlineSmall,),
                const Gap(16),
                /// Top Cards
                Row(
                  children: [
                    Expanded(
                      child: TopCard(
                        label: "Projects",
                        child: Text("02",
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: TopCard(
                          label: "Flow Rate",
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "02",
                                  style:
                                      Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
                              TextSpan(
                                  text: " m/s2",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary))
                            ]),
                          )),
                    ),
                    const Gap(16),
                    Expanded(
                      child: TopCard(
                        color: Colors.white,
                        backgroundColor: AppColours.green70,
                        label: "Status",
                        child: Text("All Systems Nominal",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const Gap(32),
                ///Projects Card
                Text("Projects", style:  Theme.of(context).textTheme.headlineSmall,),
                const Gap(16),
                GridView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   // childAspectRatio: 2,
                      crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                  itemBuilder: (context, index) {
                    return const ProjectCard(
                        project: Project(
                            id: "project 1",
                            name: "Bambui Bambili Line",
                            description:
                                "This project aims to connect the bambui bambili line, and track water for a very long disatance. This is my best effor to create a long line of text"));
                  },
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                        child: AddProjectButton(onPressed: (){})),
                    const Gap(16),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






