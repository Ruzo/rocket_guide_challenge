import 'package:equatable/equatable.dart';

class Mass extends Equatable {
  final int kg;
  final int lb;

  const Mass({this.kg = 0, this.lb = 0});

  @override
  String toString() => 'Mass(kg: $kg, lb: $lb)';

  factory Mass.fromJson(Map<String, dynamic> json) {
    return Mass(
      kg: json['kg'] as int,
      lb: json['lb'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kg': kg,
      'lb': lb,
    };
  }

  @override
  List<Object> get props => [kg, lb];
}
