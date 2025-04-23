
import 'package:flutter/material.dart';

class BandModel {
  int id;
  String name;
  int votes;
  Color color;

  BandModel({required this.id, required this.name, required this.votes , required this.color});


  factory BandModel.fromJson(Map<String, dynamic> json) => BandModel(
    id: json['id'],
    name: json['name'],
    votes: json['votes'],
    color: json['color']

  );
}