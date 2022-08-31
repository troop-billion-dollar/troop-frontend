import 'package:flutter/material.dart';
import 'package:troop/components/home/presentation/home_widgets/app_bar.dart';
import 'package:troop/components/home/presentation/home_widgets/home_card.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(62.0),
        child: TroopAppBar(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          HomeSectionHeader(
            key: const ValueKey("mega_contest_header"),
            headerTitle: "Mega Contest",
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("assets/images/banner_1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          HomeSectionHeader(
            key: const ValueKey("trending_now_header"),
            headerTitle: "Trending Now",
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: const HomeCard(),
                  ),
                );
              },
            ),
          ),
          HomeSectionHeader(
            key: const ValueKey("sectoral_contest_header"),
            headerTitle: "Sectoral Contest",
            isViewAllVisible: true,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
