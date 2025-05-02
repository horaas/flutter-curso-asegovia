import 'package:flutter/material.dart';

class IconHeaderWidget extends StatelessWidget {
  const IconHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
    
            image: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/10158/10158041.png',
            ),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff66D58A), Color(0xFFF2F2F2)],
            ),
          ),
          child: Text(
            'Messenger',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.07,
            ),
          ),
        ),
      ),
    );
  }
}
