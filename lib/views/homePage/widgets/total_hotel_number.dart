import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/home_page_provider.dart';

class HotelNumber extends StatelessWidget {
  const HotelNumber({super.key, required this.hotelNumber});

  final int hotelNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3),
      child: Text('$hotelNumber ${AppLocalizations.of(context)!.hotelAvailableLocale}'),
    );
  }
}
