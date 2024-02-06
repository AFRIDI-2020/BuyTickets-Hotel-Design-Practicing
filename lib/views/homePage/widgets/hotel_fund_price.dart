import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelFundAndPrice extends StatelessWidget {
  const HotelFundAndPrice({super.key, required this.hotelFundValue, required this.hotelPriceValue});

  final bool hotelFundValue;
  final String hotelPriceValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hotelFundValue
              ? AppLocalizations.of(context)!.fundLocale
              : AppLocalizations.of(context)!.nonFundLocale,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          hotelPriceValue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

