import 'package:flutter/material.dart';
import '../providers/home_page_provider.dart';
import 'appbar_title_section.dart';

PreferredSize homePageAppBar(HomePageProvider homePageProvider, Function() onTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 60),
    child: Container(
      color: Colors.red,
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: appBarTitleSection(
                appbarFilesModel: homePageProvider.appbarFilesModel),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey,),
                  SizedBox(width: 10),
                  Text('Search By Hotel Name / Area', style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
