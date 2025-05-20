import 'dart:convert';

TrafficResponse trafficResponseFromJson(String str) => TrafficResponse.fromJson(json.decode(str));

String trafficResponseToJson(TrafficResponse data) => json.encode(data.toJson());

class TrafficResponse {
    final String type;
    final List<double> bbox;
    final List<Feature> features;
    final Metadata metadata;

    TrafficResponse({
        required this.type,
        required this.bbox,
        required this.features,
        required this.metadata,
    });

    factory TrafficResponse.fromJson(Map<String, dynamic> json) => TrafficResponse(
        type: json["type"],
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
    };
}

class Feature {
    final List<double> bbox;
    final String type;
    final Properties properties;
    final Geometry geometry;

    Feature({
        required this.bbox,
        required this.type,
        required this.properties,
        required this.geometry,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
    };
}

class Geometry {
    final List<List<double>> coordinates;
    final String type;

    Geometry({
        required this.coordinates,
        required this.type,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type,
    };
}

class Properties {
    final List<Segment> segments;
    final List<int> wayPoints;
    final Summary summary;

    Properties({
        required this.segments,
        required this.wayPoints,
        required this.summary,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        segments: List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
        wayPoints: List<int>.from(json["way_points"].map((x) => x)),
        summary: Summary.fromJson(json["summary"]),
    );

    Map<String, dynamic> toJson() => {
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
        "way_points": List<dynamic>.from(wayPoints.map((x) => x)),
        "summary": summary.toJson(),
    };
}

class Segment {
    final double distance;
    final double duration;
    final List<Step> steps;

    Segment({
        required this.distance,
        required this.duration,
        required this.steps,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
    };
}

class Step {
    final double distance;
    final double duration;
    final int type;
    final String instruction;
    final String name;
    final List<int> wayPoints;

    Step({
        required this.distance,
        required this.duration,
        required this.type,
        required this.instruction,
        required this.name,
        required this.wayPoints,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        type: json["type"],
        instruction: json["instruction"],
        name: json["name"],
        wayPoints: List<int>.from(json["way_points"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "type": type,
        "instruction": instruction,
        "name": name,
        "way_points": List<dynamic>.from(wayPoints.map((x) => x)),
    };
}

class Summary {
    final double distance;
    final double duration;

    Summary({
        required this.distance,
        required this.duration,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
    };
}

class Metadata {
    final String attribution;
    final String service;
    final int timestamp;
    final Query query;
    final Engine engine;

    Metadata({
        required this.attribution,
        required this.service,
        required this.timestamp,
        required this.query,
        required this.engine,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        attribution: json["attribution"],
        service: json["service"],
        timestamp: json["timestamp"],
        query: Query.fromJson(json["query"]),
        engine: Engine.fromJson(json["engine"]),
    );

    Map<String, dynamic> toJson() => {
        "attribution": attribution,
        "service": service,
        "timestamp": timestamp,
        "query": query.toJson(),
        "engine": engine.toJson(),
    };
}

class Engine {
    final String version;
    final DateTime buildDate;
    final DateTime graphDate;

    Engine({
        required this.version,
        required this.buildDate,
        required this.graphDate,
    });

    factory Engine.fromJson(Map<String, dynamic> json) => Engine(
        version: json["version"],
        buildDate: DateTime.parse(json["build_date"]),
        graphDate: DateTime.parse(json["graph_date"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "build_date": buildDate.toIso8601String(),
        "graph_date": graphDate.toIso8601String(),
    };
}

class Query {
    final List<List<double>> coordinates;
    final String profile;
    final String profileName;
    final String format;

    Query({
        required this.coordinates,
        required this.profile,
        required this.profileName,
        required this.format,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        coordinates: List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        profile: json["profile"],
        profileName: json["profileName"],
        format: json["format"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "profile": profile,
        "profileName": profileName,
        "format": format,
    };
}
