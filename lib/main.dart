import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testing01/utils/themes/app_theme.dart';
import 'package:testing01/views/homePage/home_page_view.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(create: (_)=> HomePageProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePageView(),
            themeMode: provider.darkTheme? ThemeMode.dark: ThemeMode.light,
            theme: AppBaseTheme.lightTheme,
            darkTheme: AppBaseTheme.darkTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const <Locale>[
              Locale('en'),
              Locale('bn'),
              Locale('hi'),
            ],
            locale: Locale(provider.localeId),
          );
        },
      ),
    );
  }
}
