import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/settingsPage/widgets/build_switch.dart';
import 'package:testing01/views/settingsPage/widgets/language_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({super.key});

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsLocale),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              child: Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.themeLocale, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    /*---------------> TODO: Include "value" parameter <----------------*/
                    BuildSwitch(
                      switchValue: homePageProvider.darkTheme,
                      switchFunction: (value){
                        homePageProvider.setTheme();
                      },
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return const LanguageSelection();
                  },
                );
              },
              child: Card(
                child: Container(
                  width: screenSize.width,
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.languagesLocale, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
