import 'dart:ui' as ui;


import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;
import 'package:maps_app/helpers/helpers.dart';

Future <BitmapDescriptor> startCustomMarker(int minutes, String destination) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(180, 90);

  final startMarker = StartMarker(minutes: minutes, destination: destination);
  startMarker.paint(canvas, size);

  final picture = recorder.endRecording();

  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteImage = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteImage!.buffer.asUint8List());
}
Future <BitmapDescriptor> endCustomMarker(int kilometer, String destination) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(180, 90);

  final startMarker = EndMarker(kilometer: kilometer, destination: destination);
  startMarker.paint(canvas, size);

  final picture = recorder.endRecording();

  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteImage = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteImage!.buffer.asUint8List());
}