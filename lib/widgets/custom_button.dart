import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iginfo/styles.dart';
import 'package:iginfo/widgets/ease_in.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool loading;
  final Function() onPressed;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      Key? key,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseIn(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Styles.kPrimary,
          borderRadius: Styles.kRadius,
        ),
        height: 56,
        width: MediaQuery.of(context).size.width > 300
            ? 600
            : MediaQuery.of(context).size.width * 2,
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 1.2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(text, style: Styles.kSubtitle),
        ),
      ),
    );
  }
}
