import 'package:flutter/material.dart';

class LabelsCustom extends StatelessWidget {
  const LabelsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            '¿No tiene cuenta?',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              print('object');
            },
            child: Text(
              'Crea una cuent ahora',
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
