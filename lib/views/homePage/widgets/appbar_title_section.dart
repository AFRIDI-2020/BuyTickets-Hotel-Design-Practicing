import 'package:flutter/material.dart';
import 'package:testing01/models/appbar_files_model.dart';

class appBarTitleSection extends StatelessWidget {
  const appBarTitleSection({super.key, required this.appbarFilesModel});

  final AppbarFilesModel appbarFilesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appbarFilesModel.location!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        Text(
          '${appbarFilesModel.bookingDate}, ${appbarFilesModel.durationStaying} | ${appbarFilesModel.nightCount} Nights | ${appbarFilesModel.roomCount} Room, ${appbarFilesModel.adultCount} Adult',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
