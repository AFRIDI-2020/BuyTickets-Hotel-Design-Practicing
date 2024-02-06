import 'package:flutter/material.dart';

class ImageHotel extends StatelessWidget {
  const ImageHotel({super.key, required this.imageHeight, required this.imageWidth, required this.imgUrl});

  final double imageHeight, imageWidth;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
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
        },
      ),
    );
  }
}
