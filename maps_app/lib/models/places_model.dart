import 'dart:convert';

PlacesModel featuresFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String featuresToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel {
    final String type;
    final List<double> bbox;
    final List<FeaturePlaces> features;
    final GeocodingPlaces geocoding;

    PlacesModel({
        required this.type,
        required this.bbox,
        required this.features,
        required this.geocoding,
    });

    factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        type: json["type"] ?? '',
        bbox: json["bbox"] != null ? List<double>.from(json["bbox"].map((x) => x?.toDouble())) : [],
        features:json["features"] != null ?  List<FeaturePlaces>.from(json["features"].map((x) => FeaturePlaces.fromJson(x))) : [],
        geocoding: GeocodingPlaces.fromJson(json["geocoding"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "geocoding": geocoding.toJson(),
    };
}

class FeaturePlaces {
    final List<double> bbox;
    final String type;
    final PropertiesPlaces properties;
    final GeometryPlaces geometry;

    FeaturePlaces({
        required this.bbox,
        required this.type,
        required this.properties,
        required this.geometry,
    });

    factory FeaturePlaces.fromJson(Map<String, dynamic> json) => FeaturePlaces(
        bbox: json["bbox"] != null ? List<double>.from(json["bbox"].map((x) => x?.toDouble())) : [],
        type: json["type"] ?? '',
        properties: PropertiesPlaces.fromJson(json["properties"]),
        geometry: GeometryPlaces.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
    };
}

class GeometryPlaces {
    final List<double> coordinates;
    final String type;

    GeometryPlaces({
        required this.coordinates,
        required this.type,
    });

    factory GeometryPlaces.fromJson(Map<String, dynamic> json) => GeometryPlaces(
        type: json["type"] ?? '',
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class PropertiesPlaces {
    final String id;
    final String gid;
    final String layer;
    final String source;
    final String sourceId;
    final String name;
    final String matchType;
    final double distance;
    final String country;
    final String countryA;
    final String region;
    final String? regionA;
    final String county;
    final String locality;
    final String continent;
    final String label;

    PropertiesPlaces({
        required this.id,
        required this.gid,
        required this.layer,
        required this.source,
        required this.sourceId,
        required this.name,
        required this.matchType,
        required this.distance,
        required this.country,
        required this.countryA,
        required this.region,
        this.regionA,
        required this.county,
        required this.locality,
        required this.continent,
        required this.label
    });

    factory PropertiesPlaces.fromJson(Map<String, dynamic> json) => PropertiesPlaces(
        id: json["id"] ?? '',
        gid: json["gid"] ?? '',
        layer: json["layer"] ?? '',
        source: json["source"] ?? '',
        sourceId: json["source_id"] ?? '',
        name: json["name"] ?? '',
        matchType: json["match_type"] ?? '',
        distance: json["distance"]?.toDouble(),
        country: json["country"] ?? '',
        countryA: json["country_a"] ?? '',
        region: json["region"] ?? '',
        regionA: json["region_a"] ?? '',
        county: json["county"] ?? '',
        locality: json["locality"] ?? '',
        continent: json["continent"] ?? '',
        label: json["label"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gid": gid,
        "layer": layer,
        "source": source,
        "source_id": sourceId,
        "name": name,
        "match_type": matchType,
        "distance": distance,
        "country": country,
        "country_a": countryA,
        "region": region,
        "region_a": regionA,
        "county": county,
        "locality": locality,
        "continent": continent,
        "label": label,
    };
}

class GeocodingPlaces {
    final String version;
    final String attribution;
    final QueryPlaces query;
    final List<String> warnings;
    final EnginePlaces engine;
    final int timestamp;

    GeocodingPlaces({
        required this.version,
        required this.attribution,
        required this.query,
        required this.warnings,
        required this.engine,
        required this.timestamp,
    });

    factory GeocodingPlaces.fromJson(Map<String, dynamic> json) => GeocodingPlaces(
        version: json["version"] ?? '',
        attribution: json["attribution"] ?? '',
        query: QueryPlaces.fromJson(json["query"]),
        warnings: json["warnings"] != null ? List<String>.from(json["warnings"].map((x) => x)) : [],
        engine: EnginePlaces.fromJson(json["engine"]),
        timestamp: json["timestamp"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "attribution": attribution,
        "query": query.toJson(),
        "warnings": List<dynamic>.from(warnings.map((x) => x)),
        "engine": engine.toJson(),
        "timestamp": timestamp,
    };
}

class EnginePlaces {
    final String name;
    final String author;
    final String version;

    EnginePlaces({
        required this.name,
        required this.author,
        required this.version,
    });

    factory EnginePlaces.fromJson(Map<String, dynamic> json) => EnginePlaces(
        name: json["name"] ?? '',
        author: json["author"] ?? '',
        version: json["version"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "version": version,
    };
}

class QueryPlaces {
    final String text;
    final int size;
    final List<String> layers;
    final bool private;
    // final double focusPointLat;
    // final double focusPointLon;
    final LangPlaces lang;
    final int querySize;
    final String parser;
    // final ParsedTextPlaces parsedText;

    QueryPlaces({
        required this.text,
        required this.size,
        required this.layers,
        required this.private,
        // required this.focusPointLat,
        // required this.focusPointLon,
        required this.lang,
        required this.querySize,
        required this.parser,
        // required this.parsedText,
    });

    factory QueryPlaces.fromJson(Map<String, dynamic> json) => QueryPlaces(
        text: json["text"] ?? '',
        size: json["size"] ?? '',
        layers: json["layers"] != null ? List<String>.from(json["layers"].map((x) => x)) : [],
        private: json["private"] ?? '',
        // focusPointLat: json["focus.point.lat"]?.toDouble(),
        // focusPointLon: json["focus.point.lon"]?.toDouble(),
        lang: LangPlaces.fromJson(json["lang"]),
        querySize: json["querySize"] ?? '',
        parser: json["parser"] ?? '',
        // parsedText: ParsedTextPlaces.fromJson(json["parsed_text"]),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "size": size,
        "layers": List<dynamic>.from(layers.map((x) => x)),
        "private": private,
        // "focus.point.lat": focusPointLat,
        // "focus.point.lon": focusPointLon,
        "lang": lang.toJson(),
        "querySize": querySize,
        "parser": parser,
        // "parsed_text": parsedText.toJson(),
    };
}

class LangPlaces {
    final String name;
    final String iso6391;
    final String iso6393;
    final String via;
    final bool defaulted;

    LangPlaces({
        required this.name,
        required this.iso6391,
        required this.iso6393,
        required this.via,
        required this.defaulted,
    });

    factory LangPlaces.fromJson(Map<String, dynamic> json) => LangPlaces(
        name: json["name"] ?? '',
        iso6391: json["iso6391"] ?? '',
        iso6393: json["iso6393"] ?? '',
        via: json["via"] ?? '',
        defaulted: json["defaulted"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso6391": iso6391,
        "iso6393": iso6393,
        "via": via,
        "defaulted": defaulted,
    };
}

class ParsedTextPlaces {
    final String city;

    ParsedTextPlaces({
        required this.city,
    });

    factory ParsedTextPlaces.fromJson(Map<String, dynamic> json) => ParsedTextPlaces(
        city: json["city"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "city": city,
    };
}
