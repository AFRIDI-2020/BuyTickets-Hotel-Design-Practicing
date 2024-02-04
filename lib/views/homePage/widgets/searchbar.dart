import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing01/models/hotel_value.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/searchPage/providers/search_page_provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchPageProvider = Provider.of<SearchPageProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          controller: searchController,
          autofocus: true,
          textAlignVertical: TextAlignVertical.center,
          onChanged: searchValues,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: 'Search By Hotel Name / Area',
          ),
        ),
      ),
    );
  }

  void searchValues(value) {
    final searchPageProvider = Provider.of<SearchPageProvider>(context, listen: false);
    final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);

    if (searchController.text.isEmpty) {
      searchPageProvider.setSearchValues(hotels: homePageProvider.hotels.value!);
    } else {
      searchPageProvider.clearSearchItems();
      for (var element in homePageProvider.hotels.value!) {
        if (element.name!.toLowerCase().contains(searchController.text.toLowerCase()) || element.location!.toLowerCase().contains(searchController.text.toLowerCase())) {
          HotelValue value = element;
          searchPageProvider.setSearchValuesWhileSearching(value: value);
        }
      }
    }
  }
}
