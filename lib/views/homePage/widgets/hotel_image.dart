import 'package:flutter/material.dart';

import '../providers/home_page_provider.dart';
import 'loading_ui.dart';

class HotelImageLoading extends StatelessWidget {
  const HotelImageLoading({super.key, required this.screenHeight, required this.screenWidth, required this.imgUrl});

  final double screenHeight, screenWidth;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return loadingUi(loadingProgress);
          }
        },
      ),
    );
  }
}
