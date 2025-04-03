import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'random_name_provider.g.dart';

// final randomNameProvider = StateProvider.autoDispose<String>((ref) {
//   // print('randomName Provider');
//   return RandomGenerator.getRandomName();
// });
@Riverpod(keepAlive: true)
String randomName(Ref ref) {
  return RandomGenerator.getRandomName();
}
