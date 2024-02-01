import 'package:flutter/material.dart';

Center loadingUi(ImageChunkEvent loadingProgress) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
              (loadingProgress.expectedTotalBytes ?? 1)
              : null,
        ),
        Text(
          '${((loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null)! * 100).toInt()}%',
        ),
      ],
    ),
  );
}
