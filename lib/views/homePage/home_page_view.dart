import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/homePage/widgets/all_hotels_show.dart';
import 'package:testing01/views/homePage/widgets/home_page_appbar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  fetchingData() async {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    await homePageProvider.setHotelsModel();
  }

  @override
  void initState() {
    fetchingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: homePageAppBar(homePageProvider),
      body: homePageProvider.dataLoading
          ? const Center(child: CircularProgressIndicator())
          : AllHotels(homePageProvider: homePageProvider, screenSize: screenSize),
    );
  }
}
