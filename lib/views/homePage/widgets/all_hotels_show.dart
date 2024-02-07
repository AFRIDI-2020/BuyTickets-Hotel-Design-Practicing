import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/searchPage/search_page_view.dart';
import 'package:testing01/views/settingsPage/setting_page_view.dart';
import '../../hotelDetailsPage/hotel_details_page_view.dart';
import '../providers/home_page_provider.dart';
import 'custom_appbar.dart';
import 'hotel_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homePageProvider = Provider.of<HomePageProvider>(context);
    final allHotels = homePageProvider.hotels.value;
    final localization = AppLocalizations.of(context);
    final hotelAppbarItems = homePageProvider.appbarFilesModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          showLeadingIcon: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotelAppbarItems.location!),
              Text(
                '${hotelAppbarItems.bookingDate}, ${hotelAppbarItems.durationStaying} | ${hotelAppbarItems.nightCount} Nights | ${hotelAppbarItems.roomCount} Room, ${hotelAppbarItems.adultCount} Adult',
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
          actionWidgets: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPageView()));
                },
                icon: const Icon(Icons.settings),
              ),
            ),
          ],
          searchOnPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchPageView()));
          },
        ),
        /*--------------> Hotels Number <----------------*/
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3),
          child: Text(
              '${allHotels!.length} ${localization!.hotelAvailableLocale}'),
        ),
        /*----------------> Hotel List <----------------*/
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ListView.builder(
              itemCount: homePageProvider.hotels.value!.length,
              itemBuilder: (context, index) {
                final hotelItem = homePageProvider.hotels.value![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailsPageView(hotelValue: hotelItem)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        children: [
                          /*----------------> Hotel Image <---------------*/
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ImageHotel(
                              imageHeight: screenSize.height * .3,
                              imageWidth: screenSize.width,
                              imgUrl: hotelItem.image!,
                            ),
                          ),
                          const SizedBox(height: 10),
                          /*---------------> Hotel Name and Rating <--------------*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hotelItem.name!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RatingBar.builder(
                                itemSize: 20,
                                itemCount: 5,
                                initialRating: hotelItem.rating!.toDouble(),
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
                          const SizedBox(height: 5),
                          /*---------------> Hotel Location <-------------*/
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  hotelItem.location!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          /*------------------> Hotel Fund and Price <------------------*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hotelItem.fundAble!
                                    ? AppLocalizations.of(context)!.fundLocale
                                    : AppLocalizations.of(context)!
                                        .nonFundLocale,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                hotelItem.price.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
