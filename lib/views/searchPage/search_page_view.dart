import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/hotelDetailsPage/hotel_details_page_view.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);
    final hotelSearchItems =
        homePageProvider.searchingItems(searchText: searchController.text);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            controller: searchController,
            autofocus: true,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search By Hotel Name / Area',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
      body: hotelSearchItems.isEmpty
          ? const Center(
              child: Text(
                'Search Items',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: hotelSearchItems.length,
              itemBuilder: (context, index) {
                final searchItem = hotelSearchItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailsPageView(hotelValue: searchItem)));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        // leading: const Icon(Icons.house),
                        leading: SizedBox(
                          height: 100,
                          width: 80,
                          child: Image.network(
                            searchItem.image.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text('${searchItem.name}'),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${searchItem.location}'),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BDT: ${searchItem.price}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                RatingBar.builder(
                                  itemSize: 20,
                                  itemCount: 5,
                                  initialRating: searchItem.rating!.toDouble(),
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
