import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testing01/controllers/alertDialouge/alert_dialouge.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/homePage/widgets/all_hotels_show.dart';
import 'package:testing01/views/homePage/widgets/home_page_appbar.dart';
import 'package:testing01/views/searchPage/search_page_view.dart';
import 'package:testing01/views/settingsPage/setting_page_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int count = 0;

  fetchingData() async {
    final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    await homePageProvider.setHotelsModel();
  }

  void popPressed(bool didPop) {
    if (didPop) {
      return;
    }
    count = count + 1;
    if (count == 1) {
      alertDialogue(context: context, msg: "Press Again To EXit");
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          count = 0;
        });
      });
    } else {
      count = 0;
      Future.delayed(const Duration(seconds: 1));
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
    count = 0;
    fetchingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => popPressed(didPop),
      child: Scaffold(
        appBar: homePageAppBar(
          homePageProvider,
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchPageView()));
          },
          context,
          screenSize.width * .7,
        ),
        body: homePageProvider.dataLoading
            ? const Center(child: CircularProgressIndicator())
            : AllHotels(
                homePageProvider: homePageProvider, screenSize: screenSize),
      ),
    );
  }
}
