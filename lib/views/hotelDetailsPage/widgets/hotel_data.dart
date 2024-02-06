import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelData extends StatelessWidget {
  const HotelData({super.key, required this.hotelName, required this.hotelPrice});

  final String hotelName, hotelPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          '${AppLocalizations.of(context)!.currencyLocale} $hotelPrice',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }
}
