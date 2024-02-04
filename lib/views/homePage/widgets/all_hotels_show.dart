import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/widgets/total_hotel_number.dart';
import '../../hotelDetailsPage/hotel_details_page_view.dart';
import '../providers/home_page_provider.dart';
import 'hotel_fund_price.dart';
import 'hotel_image.dart';
import 'hotel_location.dart';
import 'hotel_name_rate.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({
    super.key,
    required this.homePageProvider,
    required this.screenSize,
  });

  final HomePageProvider homePageProvider;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===========================>
            // Total Hotel Number Showing
            // ===========================>
            totalHotelNumber(homePageProvider),
            // ===========================>
            // All Hotel Showing
            // ===========================>
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homePageProvider.hotels.value!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HotelDetailsPageView(hotelValue: homePageProvider.hotels.value![index])));

                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        children: [
                          // ===========================>
                          // Total Image Showing
                          // ===========================>
                          hotelImageLoading(screenSize, homePageProvider.hotels.value![index].image!),
                          const SizedBox(height: 10),
                          // ===========================>
                          // Hotel Name Showing
                          // ===========================>
                          hotelNameAndRate(homePageProvider, index),
                          const SizedBox(height: 5),
                          // ===========================>
                          // Hotel Location Showing
                          // ===========================>
                          hotelLocation(screenSize, homePageProvider, index),
                          const SizedBox(height: 5),
                          // ===========================>
                          // Hotel Fund and Price Showing
                          // ===========================>
                          hotelFundAndPrice(homePageProvider, index),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
