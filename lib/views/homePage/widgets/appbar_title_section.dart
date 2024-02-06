import 'package:flutter/material.dart';
import 'package:testing01/models/appbar_files_model.dart';

class AppBarTitleSection extends StatelessWidget {
  const AppBarTitleSection({super.key, required this.titleValue, required this.subTitleValue});

  final String titleValue, subTitleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleValue,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(
          subTitleValue,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
