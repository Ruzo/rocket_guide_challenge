import 'package:equatable/equatable.dart';

class LandingLegs extends Equatable {
  final int number;
  final String material;

  const LandingLegs({this.number = 0, this.material = ''});

  @override
  String toString() {
    return 'LandingLegs(number: $number, material: $material)';
  }

  factory LandingLegs.fromJson(Map<String, dynamic> json) {
    return LandingLegs(
      number: json['number'] as int,
      material: json['material'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'material': material,
    };
  }

  @override
  List<Object> get props => [number, material];
}
