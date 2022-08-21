import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BusyButton extends StatefulWidget {
  bool busy = false;
  final String title;
  final void Function()? onPressed;
  final bool enabled;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final BoxDecoration? decoration;
  BusyButton({
    Key? key,
    this.busy = false,
    required this.title,
    this.onPressed,
    this.enabled = true,
    this.fontSize,
    this.width,
    this.height,
    this.buttonColor,
    this.decoration,
    this.textColor,
  }) : super(key: key);

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  // Widget build(BuildContext context) {
  //   return !widget.busy
  //       ? Container(
  //           height: widget.height,
  //           width: widget.width,
  //           decoration: widget.decoration,
  //           child: MaterialButton(
  //             color: widget.buttonColor,
  //             onPressed: widget.onPressed,
  //             child: Text(
  //               widget.title,
  //               style: TextStyle(
  //                 fontSize: widget.fontSize ?? 19,
  //                 color: widget.textColor,
  //               ),
  //             ),
  //           ),
  //         )
  //       : const Center(
  //           child: SizedBox(),
  //         );
  // }
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      height: 45,
      minWidth: double.infinity,
      color: const Color(0xff570AD6),
      onPressed: () {},
      child: Text(
        "Sign up",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
