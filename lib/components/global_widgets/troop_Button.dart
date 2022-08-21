import 'package:flutter/material.dart';
import 'package:troop_ui/troop_ui.dart';

class TroopButton extends StatelessWidget {
  const TroopButton({
    Key? key,
    this.buttonTitle,
    this.onTap,
  }) : super(key: key);
  final String? buttonTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: TroopColors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 45,
      minWidth: double.infinity,
      color: const Color(0xff570AD6),
      onPressed: onTap,
      child: Text(
        buttonTitle!,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
