

import 'package:dio/dio.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;

Future <BitmapDescriptor> getAssetsImageMarker() async {
  return BitmapDescriptor.asset(
    const ImageConfiguration(
      size: Size(40, 40)
    )
    , 'assets/custom-pin.png');
}
Future <BitmapDescriptor> getUrlImageMarker() async {
  try {
    
    final response = await Dio().get(
      'https://cdn-icons-png.flaticon.com/512/2390/2390589.png',
      options: Options(
        responseType: ResponseType.bytes,
      )
    );
    //resize image
    final imageCode = await ui.instantiateImageCodec(
      response.data, targetHeight: 40, targetWidth: 40
    );
    final frame = await imageCode.getNextFrame();
    final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

    if (data == null) {
      return getAssetsImageMarker();
    }


    return BitmapDescriptor.bytes(data.buffer.asUint8List());
  } catch (e) {
    print(e.toString());
    return getAssetsImageMarker();
  }

}