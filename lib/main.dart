import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing01/views/homePage/home_page_view.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePageView(),
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
