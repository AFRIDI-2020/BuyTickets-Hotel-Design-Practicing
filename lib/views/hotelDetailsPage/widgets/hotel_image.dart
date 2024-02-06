import 'package:flutter/material.dart';

import '../../homePage/widgets/hotel_image.dart';

class HotelImage extends StatelessWidget {
  const HotelImage({super.key, required this.containerHeight, required this.containerWidth, required this.imageHeight, required this.imageWidth, required this.imgUrl});

  final double containerHeight, containerWidth, imageHeight, imageWidth;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: containerWidth,
      child: HotelImageLoading(screenHeight: imageHeight, screenWidth: imageWidth, imgUrl: imgUrl),
    );
  }
}
