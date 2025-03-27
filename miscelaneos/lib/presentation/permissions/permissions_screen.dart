import 'package:flutter/material.dart';

class PermissionsScreen extends StatelessWidget {

  const PermissionsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Column(
            children: [
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
              CheckboxListTile(value: false, onChanged: (value) {
                
              }, title: Text('Permiso'),),
            ],
           ),
       );
  }
}