import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:testing01/views/settingsPage/constants/constants.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Suggested Language', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: screenSize.height * .008),
            Expanded(
              child: ListView.builder(
                itemCount: appsLocaleValues.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          homePageProvider.setLocale(value: appsLocaleValues[index]['value']!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(appsLocaleValues[index]['title']!),
                              const Spacer(),
                              Visibility(
                                visible: homePageProvider.localeId == appsLocaleValues[index]['value'],
                                child: Checkbox(value: true, onChanged: (_){}),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
