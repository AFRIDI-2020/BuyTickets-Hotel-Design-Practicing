import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:buy_tickets_list/network/network_requester.dart';
import 'package:buy_tickets_list/screens/booking_room_screen.dart';
import 'package:buy_tickets_list/screens/home/widgets/hotel_list_item.dart';
import 'package:buy_tickets_list/widget/input_feild_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  HotelDetailsModel? _hotelDetailsModel;

  final searchBarController = TextEditingController();

  //call data
  Future _getAllHotelInformation() async {
    isLoading = true;
    final response = await NetworkRequester().getData();
    isLoading = false;
    _hotelDetailsModel = HotelDetailsModel.fromJson(response);
    setState(() {});
    print(_hotelDetailsModel?.hotelDetails);
  }

  @override
  void initState() {
    _getAllHotelInformation();
    super.initState();
  }

  //search function
  List<HotelDetail> searchList() {
    if (searchBarController.text.isEmpty) {
      return _hotelDetailsModel!.hotelDetails;
    }
    return _hotelDetailsModel!.hotelDetails
        .where((element) =>
            element.hotelName.toLowerCase().startsWith(searchBarController.text.toLowerCase()) ||
            element.hotelAddress.toLowerCase().startsWith(searchBarController.text.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = searchList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 130,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 5, right: 5, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30,),

              const Text(
                "Bangladesh,Dhaka",
                maxLines: 2,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "01 Sep,24,-02 Sep 24| 1 Night|1 Room,1 Adult",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),

              //form feild widget
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchBarController,
                decoration: InputFeildDecoration(),
              )
              // SizedBox(height:,)
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : list.isEmpty
              ? const Center(
                  child: Text(
                  "No Data Found",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
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
                                      hotelStarRating: list[index].hotelRatingStar,
                                    )));
                      },
                      child: HotelListItem(
                        hotel: list[index],
                      ),
                    );
                  }),
    );
  }
}
