import 'package:equatable/equatable.dart';

class Height extends Equatable {
  final double meters;
  final double feet;

  const Height({this.meters = 0, this.feet = 0});

  @override
  String toString() => 'Height(meters: $meters, feet: $feet)';

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
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
