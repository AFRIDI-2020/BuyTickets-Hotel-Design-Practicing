import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testing01/controllers/alertDialouge/alert_dialouge.dart';
import 'package:testing01/models/hotel_value.dart';
import 'package:testing01/views/homePage/widgets/hotel_image.dart';
import 'package:testing01/views/homePage/widgets/hotel_location.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/booking_button.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_data.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_description.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_image.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_rating.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelDetailsPageView extends StatelessWidget {
  const HotelDetailsPageView({super.key, required this.hotelValue});

  final HotelValue hotelValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelImage(
              containerHeight: screenSize.height * .4,
              containerWidth: screenSize.width,
              imageHeight: screenSize.height * .3,
              imageWidth: screenSize.width,
              imgUrl: hotelValue.image!,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotelValue.name!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  HotelLocation(
                      containerWidth: screenSize.width * .7,
                      hotelLocation: hotelValue.location!),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HotelData(
                          hotelName: AppLocalizations.of(context)!.priceLocale,
                          hotelPrice: hotelValue.price!.toString()),
                      HotelRating(
                          title: AppLocalizations.of(context)!.rateLocale, rate: hotelValue.rating!.toDouble()),
                      BookingButton(
                          title: AppLocalizations.of(context)!.bookLocale,
                          bookingPressed: () {
                            alertDialogue(context: context, msg: AppLocalizations.of(context)!.nullContentLocale);
                          },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.detailsLocale,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      HotelDescription(hotelName: hotelValue.name!),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * .1),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: screenSize.width,
              child: BookingButton(
                  title: AppLocalizations.of(context)!.bookNowLocale,
                  bookingPressed: () {
                    alertDialogue(context: context, msg: AppLocalizations.of(context)!.nullContentLocale);
                  },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
