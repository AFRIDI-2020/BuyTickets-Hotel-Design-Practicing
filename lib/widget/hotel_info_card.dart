import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelInformationCardWidget extends StatelessWidget {
  final String hotelImage;
  final String hotelName;
  final double hotelStarRating;
  final String hotelAddress;
  final String price;

  const HotelInformationCardWidget(
      {super.key,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelStarRating,
      required this.hotelAddress,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Hotel Image
          Image.network(
            hotelImage,
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          // SizedBox(width: 5,),
          //hotel name and rating of hotel
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotelName,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //hotel rating bar package
                  RatingBarIndicator(
                    rating: hotelStarRating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              //hotel address
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 18,
                  ),
                  Text(
                    "${hotelAddress}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              // price section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Non Refound",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "${price}",
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              )
            ],
          )
        ],
      ),
    );
  }
}
