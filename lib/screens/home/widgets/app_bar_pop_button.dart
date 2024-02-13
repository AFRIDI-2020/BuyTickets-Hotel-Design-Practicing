// import 'package:buy_tickets_list/language_change/controller/language_change_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// enum language{english,bangla}
//
// class AppBarPopUpButton extends StatelessWidget {
//
//    AppBarPopUpButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LanguageChangeController>(builder: (context,provider,child){
//       return PopupMenuButton(
//
//         iconColor: Colors.white,
//           onSelected: (language item){
//             if(language.english.name==item.name){
//
//               provider.changeLanguage(Locale("en"));
//             }else{
//
//               provider.changeLanguage(Locale("bn"));
//             }
//
//           },
//           itemBuilder: (BuildContext context)=><PopupMenuEntry<language>>[
//
//             PopupMenuItem(
//                 value: language.english,
//                 child: Text("English")),
//             PopupMenuItem(
//                 value: language.bangla,
//                 child: Text("Bangla")),
//
//           ]
//       );
//
//
//     });
//   }
// }
