import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:buy_tickets_list/network/network_requester.dart';
import 'package:buy_tickets_list/screens/booking_room_screen.dart';
import 'package:buy_tickets_list/widget/hotel_info_card.dart';
import 'package:buy_tickets_list/widget/input_feild_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  HotelDetailsModel? _hotelDetailsModel;
  final searchBarController = TextEditingController();

  //call data
  Future getAllHotelInformation() async {
    isLoading = true;
    //get data function call
    final response = await NetworkRequester().getData();
    isLoading = false;

    _hotelDetailsModel = HotelDetailsModel.fromJson(response);
    setState(() {

    });
    print(_hotelDetailsModel?.hotelDetails);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllHotelInformation();

  }


  //search function
  List<HotelDetail> searchList(List<HotelDetail> newHotelInformation) {
    return newHotelInformation
        .where((element) =>
            element.hotelName
                .toLowerCase()
                .contains(searchBarController.text.toLowerCase()) ||
            element.hotelAddress
                .toLowerCase()
                .contains(searchBarController.text.toLowerCase()))
        .toList();

  }




  @override
  Widget build(BuildContext context) {
    final list =
    searchList(_hotelDetailsModel?.hotelDetails ?? []);



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 130,
        title: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 5, right: 5, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30,),

              const Text(
                "Bangladesh,Dhaka",
                maxLines: 2,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5,),
              Text("01 Sep,24,-02 Sep 24| 1 Night|1 Room,1 Adult",style: TextStyle(color: Colors.white,fontSize: 15),),
              const SizedBox(
                height: 5,
              ),

              //form feild widget
              TextFormField(
                onChanged: (value) {
                  setState(() {
                  });
                  // print("aaaaaaaaaaaaaaaaaaaaa ${newHotelInformation}");
                },
                controller: searchBarController,
                //text form feild decoration widget
                decoration: InputFeildDecoration(),
              )
              // SizedBox(height:,)
            ],
          ),
        ),
      ),

      body:list.isEmpty && searchBarController.text.isNotEmpty
          ? const Center(
              child: Text(
              "No Data Found",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          :
          // searchBarController.text.isNotEmpty && newHotelInformation.length.is ?Center(child: Text("No Data Found"),) :
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final searchData = searchBarController.text.isNotEmpty;
                    final result = _hotelDetailsModel?.hotelDetails;
                    //hotel information card widget call
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingRoomScreen(
                                      hotelImage: list[index].hotelImage,
                                      hotelName: list[index].hotelName,
                                      hotelAddress: list[index].hotelAddress,
                                      price: list[index].price.toString(),
                                      hotelStarRating:
                                          list[index].hotelRatingStar,
                                    )));
                      },
                      child: HotelInformationCardWidget(
                        hotelImage: list[index].hotelImage,
                        hotelName: list[index].hotelName,
                        hotelAddress: list[index].hotelAddress,
                        price: list[index].price.toString(),
                        hotelStarRating:
                        list[index].hotelRatingStar,


                      ),
                    );
                  }),
    );
  }
}
