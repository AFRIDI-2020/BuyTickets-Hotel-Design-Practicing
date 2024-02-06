import 'package:flutter/material.dart';
import 'package:testing01/views/settingsPage/setting_page_view.dart';
import '../providers/home_page_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppBar homePageAppBar(HomePageProvider homePageProvider, Function() onTap,
    BuildContext context, double textAreaWidth) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsPageView()));
      },
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "titleValue",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(
          "subTitleValue",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    ),
    bottom: PreferredSize(
      // preferredSize: const Size.fromHeight(kToolbarHeight + 60),
      preferredSize: const Size.fromHeight(60),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              SizedBox(
                  width: textAreaWidth,
                  child: Text(AppLocalizations.of(context)!.searchHintLocale,
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    ),
  );
}
