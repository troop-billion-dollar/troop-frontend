import 'package:flutter/material.dart';
import 'package:troop_ui/troop_ui.dart';
// import 'package:presto/ui/shared/colors.dart';

class InputField extends StatefulWidget {
  /// The [controller] has control over the input Stream from user.
  final TextEditingController? controller;

  /// In-case your input field requires a validator
  /// in order to validate user input
  /// [validator] comes into action
  /// supply a future function which returns null on successful validation
  /// and returns an error string on failure
  final Future<String?> Function(String?)? validator;

  /// After validation if you wish to reflect changes in your screen
  /// supply [validationSuccessCallBack] for success callback
  /// and [validationFailureCallBack] for failure callback
  final Function? validationSuccessCallBack;
  final Function? validationFailureCallBack;

  /// Supply [hintText] if you wish to indicate hint inside the text field
  final String? hintText;

  /// Default Keyboard type is Text
  /// for different types supply [keyboardType]
  final TextInputType? keyboardType;

  /// To show small help message below the text field provide [helperText]
  final String? helperText;

  /// If on wishes to retain the state of the text field
  /// provide [fieldKey] to differentiate the fields in the widget tree
  final Key? fieldKey;

  /// In-case of sensitive data, supply true value for [shouldObscure]
  /// This will itself show a toggle icon for visibility of the obscured text
  final bool shouldObscure;

  /// Validate only on onSubmitted?
  final bool validateOnlyOnSubmit;

  /// If user wishes to control the focus of text field explicitly,
  /// provide [focusNode] to gain more control over the field.
  final FocusNode? focusNode;

  /// Suffix Widget [suffixWidget]
  final Widget? suffixWidget;

  /// Suffix Widget [prefixWidget]
  final Widget? prefixWidget;

  /// If one wants to change the border color of the text field,
  /// depending on validation results,
  /// Input color for [success] and [failure] fields
  /// default success and failure colors are Green and Red
  final Color success;
  final Color failure;
  final TextStyle? hintStyle;
  InputField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    this.fieldKey,
    this.helperText,
    this.validationSuccessCallBack,
    this.validationFailureCallBack,
    this.shouldObscure = false,
    this.focusNode,
    this.suffixWidget,
    this.prefixWidget,
    this.validateOnlyOnSubmit = false,
    this.success = Colors.green,
    this.failure = Colors.red,
    this.hintStyle,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool obscureText;
  bool? validated;
  bool? inProcess;
  String? error;
  Color getBorderColor(bool? value) {
    if (value != null) {
      return value ? widget.success : widget.failure;
    }
    return Colors.black;
  }

  Widget? getTickWidget() {
    if (validated == null) return null;
    if (inProcess != null) if (inProcess!)
      return Container(
        height: MediaQuery.of(context).size.height / 50,
        width: MediaQuery.of(context).size.height / 50,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 80,
          horizontal: MediaQuery.of(context).size.height / 80,
        ),
        child: Center(child: CircularProgressIndicator()),
      );
    if (validated!)
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    else
      return Icon(
        Icons.error,
        color: Colors.red,
      );
  }

  @override
  void initState() {
    widget.shouldObscure ? obscureText = true : obscureText = false;
    if (widget.shouldObscure) assert(widget.suffixWidget == null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? finalText;
    return TextFormField(
      controller: widget.controller,
      key: widget.fieldKey,
      obscureText: obscureText,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: TroopColors.white,
        prefixIcon: widget.prefixWidget,
        suffixIcon: widget.shouldObscure
            ? (obscureText
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = false;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = true;
                      });
                    },
                  ))
            : (widget.suffixWidget == null && widget.validator != null
                ? getTickWidget()
                : widget.suffixWidget),
        errorText: error,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        helperText: validated == null ? null : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      onFieldSubmitted: (text) async {
        if (widget.validateOnlyOnSubmit) {
          try {
            setState(() {
              inProcess = true;
            });
            String? result = await widget.validator!(finalText!);
            if (result == null) {
              /// Validation Success
              setState(() {
                inProcess = false;
                validated = true;
                error = null;
              });
              widget.validationSuccessCallBack!();
            } else {
              /// Failed validation
              setState(() {
                inProcess = false;
                validated = false;
                error = result;
              });
              widget.validationFailureCallBack!();
            }
          } catch (e) {
            if (e is TypeError) {
              debugPrint(e.toString());
            }
          }
        }
      },
      onChanged: (text) async {
        finalText = text;
        if (!widget.validateOnlyOnSubmit) {
          try {
            setState(() {
              inProcess = true;
            });
            String? result = await widget.validator!(text);
            if (result == null) {
              /// Validation Success
              setState(() {
                inProcess = false;
                validated = true;
                error = null;
              });
              widget.validationSuccessCallBack!();
            } else {
              /// Failed validation
              setState(() {
                inProcess = false;
                validated = false;
                error = result;
              });
              widget.validationFailureCallBack!();
            }
          } catch (e) {
            if (e is TypeError) {
              debugPrint("No validator was supplied");
            }
          }
        }
      },
      keyboardType: widget.keyboardType,
    );
  }
}
