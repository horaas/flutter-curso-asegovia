import 'package:flutter/material.dart';
import 'package:test_app_desing/helpers/data.dart';

class CustomScroll extends StatelessWidget {
  final List<Game> game;
  const CustomScroll({ super.key, required this.game });

   @override
   Widget build(BuildContext context) {
       return SizedBox(
        height: 250,
         child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: game.length,
          itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 SizedBox(
                   width: 140,
                   height: 180,
                   child: Image.network(game[index].coverImage.url,fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Text('data'),),
                 ),
                 SizedBox(height: 5,),
                 SizedBox(
                   width: 140,
                   child: Text(game[index].title, maxLines: 2,),
                 )
               ],
             ),
           );
         },),
       );
  }
}

