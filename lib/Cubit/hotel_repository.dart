import 'dart:convert';

import 'package:flutter/services.dart';

import 'hotel.dart';


class HotelRepository{

  Future<dynamic> getAll() async{
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> decodedData = jsonDecode(jsonString);

    // Convert decoded data to a list of Hotel objects
    List<Hotel> hotels = decodedData.map((e) {
      return Hotel(
          id: e['id'],
          imgUrl: e['imgUrl'],
          currentPrice: e['currentPrice'],
          oldPrice: e['oldPrice'],
          discount: e['discount'],
          name: e['name'],
          shortLocation: e['shortLocation'],
          fullLocation: e['fullLocation'],
          shortReview: e['shortReview'],
          rating: e['rating'],
          like: e['like'],
          subtitle: e['subtitle'],
          sponsor: e['sponsor']
      );
    }).toList();
    return hotels;
  }
}