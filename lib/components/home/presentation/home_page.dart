import 'package:flutter/material.dart';
import 'package:troop/components/home/presentation/home_widgets/app_bar.dart';

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
          SizedBox(
            height: 26,
            width: double.infinity,
            child: Text(
              "Mega Contest",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
