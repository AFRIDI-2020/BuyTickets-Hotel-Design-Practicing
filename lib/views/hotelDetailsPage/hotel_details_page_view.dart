import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testing01/controllers/alertDialouge/alert_dialouge.dart';
import 'package:testing01/models/hotel_value.dart';
import 'package:testing01/views/homePage/widgets/hotel_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelDetailsPageView extends StatelessWidget {
  const HotelDetailsPageView({super.key, required this.hotelValue});

  final HotelValue hotelValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*---------------> Hotel Image <---------------*/
            ImageHotel(
                imageHeight: screenSize.height * .4,
                imageWidth: screenSize.width,
                imgUrl: hotelValue.image!),
            const SizedBox(height: 10),
            /*----------------> All Hotels Details <--------------*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*-----------------> Hotel Name <-------------*/
                  Text(
                    hotelValue.name!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  /*---------------> Hotel Location <-------------*/
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          hotelValue.location!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  /*----------------> Hotel Price <-----------------*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localization!.priceLocale,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '${localization!.currencyLocale} ${hotelValue.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      /*----------------> Hotel Rating <----------------*/
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localization!.rateLocale,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            itemCount: 5,
                            initialRating: hotelValue.rating!.toDouble(),
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 15,
                              );
                            },
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                      /*-------------------> Book Button <------------------*/
                      ElevatedButton(
                        onPressed: () {
                          alertDialogue(
                              context: context, msg: localization.nullContentLocale);
                        },
                        child: Text(
                          localization.bookLocale,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  /*-----------------> Hotel Description <-------------------*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.detailsLocale,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                          "${hotelValue.name} offers you a privileged experience combining comfort and conviviality. Whether you are a backpacker, a solo traveler or with your family, our hotel with top-of-the-range service will meet all your expectations. More than just a hotel, ${hotelValue.name} offers you a place to live and meet people.The ${hotelValue.name} hotel offers a complete experience with common areas that allow you to meet new people in a unique atmosphere. Lounge area, Ping Pong table, table soccer, darts & Boiler room: we told you, it’s not a hotel like the others, it’s a sharing hotel.")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * .1),
            /*-------------------> Booking Now Button <----------------*/
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: screenSize.width,
              child: ElevatedButton(
                onPressed: () {
                  alertDialogue(
                      context: context, msg: localization.nullContentLocale);
                },
                child: Text(localization!.bookNowLocale),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
