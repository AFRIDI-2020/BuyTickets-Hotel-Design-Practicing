import 'dart:core';
import 'dart:core';

import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:buy_tickets_list/widget/elevated_button_widget.dart';
import 'package:buy_tickets_list/screens/home/widgets/hotel_list_item.dart';
import 'package:flutter/material.dart';

class HotelDetailsScreen extends StatefulWidget {
final HotelDetail hotel;


  const HotelDetailsScreen(this.hotel
  );

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 110,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0, left: 5, right: 5, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30,),

              Text(
                "Bangladesh,Dhaka",
                maxLines: 2,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "01 Sep,24,-02 Sep 24| 1 Night|1 Room,1 Adult",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),

              // SizedBox(height:,)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            HotelListItem(hotel: widget.hotel),

            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonWidget(
                  text: 'Select Room',
                  backgroundColor: Colors.red,
                  onTap: () {},
                  textColor: Colors.white,
                ))

          ],
        ),
      ),
    );
  }
}

