import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const kScaffold = Color(0xFF191A1C);
  static const kPrimary = Color(0xFF6242E2);
  static const kRadius = BorderRadius.all(Radius.circular(10));
  static const kPadding = EdgeInsets.all(20);

  static final kTitle = GoogleFonts.lato(
    fontSize: 21,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final kSubtitle = GoogleFonts.lato(
    fontSize: 16,
    color: Colors.white,
  );

  static final kTextFormDecoration = InputDecoration(
    contentPadding: const EdgeInsets.all(25),
    hintStyle: Styles.kSubtitle,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade200,
        width: 1,
      ),
      borderRadius: Styles.kRadius,
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: Styles.kRadius,
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: Styles.kRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade200,
        width: 1,
      ),
      borderRadius: Styles.kRadius,
    ),
  );
}
