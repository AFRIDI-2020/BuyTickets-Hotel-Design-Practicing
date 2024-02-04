import 'package:flutter/material.dart';

import '../../homePage/widgets/hotel_image.dart';

SizedBox hotelImage(Size screenSize, String image) {
  return SizedBox(
    height: screenSize.height * .4,
    width: screenSize.width,
    child: hotelImageLoading(screenSize, image),
  );
}
