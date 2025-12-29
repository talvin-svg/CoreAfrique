import 'package:coreafrique/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const AppOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle ?? AppTheme.lightTheme.outlinedButtonTheme.style,
      child: Text(
        text,
        style: textStyle ?? AppTheme.lightTheme.textTheme.bodyLarge,
      ),
    );
  }
}
