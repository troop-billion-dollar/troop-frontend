import 'package:flutter/material.dart';
import 'package:troop/components/auth/presentation/login/login.dart';

class TroopAppBar extends StatelessWidget {
  const TroopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10.0,
      shadowColor: TroopColors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          "assets/images/troop_logo.png",
          key: const ValueKey("troop_logo_image"),
          height: 40,
          width: 40,
        ),
      ),
      title: Text(
        "Troop",
        style: Theme.of(context).textTheme.appBarTitleStyleing,
      ),
      actions: [
        Image.asset(
          "assets/images/wallet.png",
          key: const ValueKey("troop_wallent_icon"),
          height: 50,
          width: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          "assets/images/menu_icon.png",
          key: const ValueKey("troop_menu_icon"),
          height: 50,
          width: 50,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
