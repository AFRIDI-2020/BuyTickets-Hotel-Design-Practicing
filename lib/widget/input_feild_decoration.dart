
import 'package:flutter/material.dart';

InputDecoration InputFeildDecoration() {
  return InputDecoration(

      hintText: "Search by hotel name/area",
      prefixIcon: Icon(Icons.search),
      contentPadding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),

      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
      )
  );
}
