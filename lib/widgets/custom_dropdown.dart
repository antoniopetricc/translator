import 'package:translator/styles.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  final String selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.change_circle, color: Styles.kPrimary),
      dropdownColor: Styles.kScaffold,
      underline: Container(),
      onChanged: onChanged,
      value: selectedValue,
      items: items,
    );
  }

  List<DropdownMenuItem<String>> get items {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Italiano ",
          style: Styles.kSubtitle,
        ),
        value: "it",
      ),
      DropdownMenuItem(
        child: Text(
          "English ",
          style: Styles.kSubtitle,
        ),
        value: "en",
      ),
      DropdownMenuItem(
        child: Text(
          "Arabic ",
          style: Styles.kSubtitle,
        ),
        value: "ar",
      ),
      DropdownMenuItem(
        child: Text(
          "Azerbaijani ",
          style: Styles.kSubtitle,
        ),
        value: "az",
      ),
      DropdownMenuItem(
        child: Text(
          "Chinese ",
          style: Styles.kSubtitle,
        ),
        value: "zh",
      ),
      DropdownMenuItem(
        child: Text(
          "Czech ",
          style: Styles.kSubtitle,
        ),
        value: "cs",
      ),
      DropdownMenuItem(
        child: Text(
          "Dutch ",
          style: Styles.kSubtitle,
        ),
        value: "nl",
      ),
      DropdownMenuItem(
        child: Text(
          "Finnish ",
          style: Styles.kSubtitle,
        ),
        value: "fi",
      ),
      DropdownMenuItem(
        child: Text(
          "French ",
          style: Styles.kSubtitle,
        ),
        value: "fr",
      ),
      DropdownMenuItem(
        child: Text(
          "German ",
          style: Styles.kSubtitle,
        ),
        value: "de",
      ),
      DropdownMenuItem(
        child: Text(
          "Hindi ",
          style: Styles.kSubtitle,
        ),
        value: "hi",
      ),
      DropdownMenuItem(
        child: Text(
          "Spanish ",
          style: Styles.kSubtitle,
        ),
        value: "es",
      ),
    ];
    return menuItems;
  }
}
