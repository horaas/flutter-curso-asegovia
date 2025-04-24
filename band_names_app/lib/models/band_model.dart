import 'package:flutter/material.dart';

class BandModel {
  final int id;
  final String name;
  final int votes;
  final Color color;

  const BandModel({
    required this.id,
    required this.name,
    required this.votes,
    required this.color,
  });

  factory BandModel.fromJson(Map<String, dynamic> json) => BandModel(
    id: json['id'],
    name: json['name'],
    votes: json['votes'],
    color: json['color'],
  );

  BandModel copyWith({int? id, String? name, int? votes, Color? color}) =>
      BandModel(
        id: id ?? this.id,
        name: name ?? this.name,
        votes: votes ?? this.votes,
        color: color ?? this.color,
      );
}
