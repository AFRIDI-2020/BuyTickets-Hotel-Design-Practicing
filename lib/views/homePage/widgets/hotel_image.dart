import 'package:flutter/material.dart';

import '../providers/home_page_provider.dart';
import 'loading_ui.dart';

ClipRRect hotelImageLoading(
    Size screenSize, String imageUrl) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: SizedBox(
      height: screenSize.height * .3,
      width: screenSize.width,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return loadingUi(loadingProgress);
          }
        },
      ),
    ),
  );
}