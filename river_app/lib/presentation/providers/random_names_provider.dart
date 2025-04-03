import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_names_provider.g.dart';

@riverpod
Stream<String> namesStream(Ref ref) async* {
  await for (final name in RandomGenerator.randomNamesStream()) {
    yield name;
  }
}

// final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  
//     await for( final name in RandomGenerator.randomNamesStream() ) {

//       yield name;
//     }


// });



// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
  
//   await Future.delayed(const Duration(seconds: 2));
  
  
//   yield [];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['Fernando'];
//   await Future.delayed(const Duration(seconds: 2));
  
//   yield ['Fernando','Melissa'];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['Fernando','Melissa', 'Juan'];

// });