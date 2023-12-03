import 'package:app_ui/app_ui.dart';

// ignore: non_constant_identifier_names
BoxDecoration CUSTOM_CARD_DECORATION = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(
      6.0.r), // Increased borderRadius for better visibility
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
    ),
  ],
);
