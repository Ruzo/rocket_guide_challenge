import 'package:equatable/equatable.dart';

class Diameter extends Equatable {
  final double meters;
  final double feet;

  const Diameter({this.meters = 0, this.feet = 0});

  @override
  String toString() {
    return 'Diameter(meters: $meters, feet: $feet)';
  }

  factory Diameter.fromJson(Map<String, dynamic> json) {
    return Diameter(
      meters: json['meters'].toDouble(),
      feet: json['feet'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meters': meters,
      'feet': feet,
    };
  }

  @override
  List<Object> get props => [meters, feet];
}
