import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/widgets/searchbar.dart';

import '../providers/home_page_provider.dart';
import 'appbar_title_section.dart';

PreferredSize homePageAppBar(HomePageProvider homePageProvider) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 50 + 10),
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
          const SearchBarWidget(),
        ],
      ),
    ),
  );
}
