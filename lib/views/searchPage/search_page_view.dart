import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/homePage/widgets/searchbar.dart';
import 'package:testing01/views/hotelDetailsPage/hotel_details_page_view.dart';
import 'package:testing01/views/searchPage/providers/search_page_provider.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    final searchPageProvider = Provider.of<SearchPageProvider>(context);
    final homePageProvider = Provider.of<HomePageProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const SearchBarWidget(),
      ),
      body: searchPageProvider.searchList == null
          ? const Center(
              child: Text(
                'Search Items',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20),
              ),
            )
          : ListView.builder(
            itemCount: searchPageProvider.searchList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HotelDetailsPageView(hotelValue: searchPageProvider.searchList[index])));
                },
                child: Column(
                  children: [
                    ListTile(
                      // leading: const Icon(Icons.house),
                      leading: SizedBox(
                        height: 100,
                        width: 80,
                        child: Image.network(
                          searchPageProvider.searchList[index].image
                              .toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                          '${searchPageProvider.searchList[index].name}'),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${searchPageProvider.searchList[index].location}'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BDT: ${searchPageProvider.searchList[index].price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              RatingBar.builder(
                                itemSize: 20,
                                itemCount: 5,
                                initialRating: searchPageProvider
                                    .searchList![index].rating!
                                    .toDouble(),
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
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
    );
  }
}
