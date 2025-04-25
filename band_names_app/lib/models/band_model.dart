import 'package:flutter/material.dart';

class BandModel {
  final String id;
  final String name;
  final int votes;

  const BandModel({
    required this.id,
    required this.name,
    required this.votes,
  });

  factory BandModel.fromJson(Map<String, dynamic> json) => BandModel(
    id: json.containsKey('id') ? json['id'] : 'no-id',
    name: json.containsKey('name') ?  json['name'] : 'no-name',
    votes: json.containsKey('votes') ?  json['votes'] : 'no-votes'
  );

  BandModel copyWith({String? id, String? name, int? votes, Color? color}) =>
      BandModel(
        id: id ?? this.id,
        name: name ?? this.name,
        votes: votes ?? this.votes,
      );
}
