import 'package:equatable/equatable.dart';

import "diameter.dart";
import "engines.dart";
import "height.dart";
import "landing_legs.dart";
import "mass.dart";

class Rocket extends Equatable {
  final String id;
  final String name;
  final String type;
  final bool active;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final int successRatePct;
  final String firstFlight;
  final String country;
  final String company;
  final String wikipedia;
  final String description;
  final Height height;
  final Diameter diameter;
  final Mass mass;
  final Engines engines;
  final LandingLegs landingLegs;
  final List<String> flickrImages;

  const Rocket({
    this.id = '',
    this.name = '',
    this.type = '',
    this.active = false,
    this.stages = 0,
    this.boosters = 0,
    this.costPerLaunch = 0,
    this.successRatePct = 0,
    this.firstFlight = '',
    this.country = '',
    this.company = '',
    this.wikipedia = '',
    this.description = '',
    this.height,
    this.diameter,
    this.mass,
    this.engines,
    this.landingLegs,
    this.flickrImages,
  });

  @override
  String toString() {
    return 'Rocket(id: $id, name: $name, type: $type, active: $active, stages: $stages, boosters: $boosters, costPerLaunch: $costPerLaunch, successRatePct: $successRatePct, firstFlight: $firstFlight, country: $country, company: $company, wikipedia: $wikipedia, description: $description, height: $height, diameter: $diameter, mass: $mass, engines: $engines, landingLegs: $landingLegs, flickrImages: $flickrImages)';
  }

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'] as String ?? '',
      name: json['name'] as String ?? '',
      type: json['type'] as String ?? '',
      active: json['active'] as bool ?? false,
      stages: json['stages'] as int ?? 0,
      boosters: json['boosters'] as int ?? 0,
      costPerLaunch: json['cost_per_launch'] as int ?? 0,
      successRatePct: json['success_rate_pct'] as int ?? 0,
      firstFlight: json['first_flight'] as String ?? '',
      country: json['country'] as String ?? '',
      company: json['company'] as String ?? '',
      wikipedia: json['wikipedia'] as String ?? '',
      description: json['description'] as String ?? '',
      height: json['height'] == null ? null : Height.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null ? null : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
      mass: json['mass'] == null ? null : Mass.fromJson(json['mass'] as Map<String, dynamic>),
      engines: json['engines'] == null ? null : Engines.fromJson(json['engines'] as Map<String, dynamic>),
      landingLegs:
          json['landing_legs'] == null ? null : LandingLegs.fromJson(json['landing_legs'] as Map<String, dynamic>),
      flickrImages: List<String>.from(json['flickr_images']) ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'active': active,
      'stages': stages,
      'boosters': boosters,
      'cost_per_launch': costPerLaunch,
      'success_rate_pct': successRatePct,
      'first_flight': firstFlight,
      'country': country,
      'company': company,
      'wikipedia': wikipedia,
      'description': description,
      'height': height?.toJson(),
      'diameter': diameter?.toJson(),
      'mass': mass?.toJson(),
      'engines': engines?.toJson(),
      'landing_legs': landingLegs?.toJson(),
      'flickr_images': flickrImages,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      type,
      active,
      stages,
      boosters,
      costPerLaunch,
      successRatePct,
      firstFlight,
      country,
      company,
      wikipedia,
      description,
      height,
      diameter,
      mass,
      engines,
      landingLegs,
      flickrImages,
    ];
  }

  Rocket empty(id) {
    return Rocket(
      id: id,
      name: 'Missing',
    );
  }
}
