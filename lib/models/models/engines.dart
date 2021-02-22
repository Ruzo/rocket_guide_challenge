import 'package:equatable/equatable.dart';

class Engines extends Equatable {
  final int number;
  final String type;
  final String version;
  final String layout;
  final int engineLossMax;
  final String propellant_1;
  final String propellant_2;
  final double thrustToWeight;

  const Engines({
    this.number = 0,
    this.type = '',
    this.version = '',
    this.layout = '',
    this.engineLossMax = 0,
    this.propellant_1 = '',
    this.propellant_2 = '',
    this.thrustToWeight = 0.0,
  });

  @override
  String toString() {
    return 'Engines(number: $number, type: $type, version: $version, layout: $layout, engineLossMax: $engineLossMax, propellant_1: $propellant_1, propellant_2: $propellant_2, thrustToWeight: $thrustToWeight)';
  }

  factory Engines.fromJson(Map<String, dynamic> json) {
    return Engines(
      number: json['number'] as int,
      type: json['type'] as String,
      version: json['version'] as String,
      layout: json['layout'] as String,
      engineLossMax: json['engine_loss_max'] as int,
      propellant_1: json['propellant_1'] as String,
      propellant_2: json['propellant_2'] as String,
      thrustToWeight: json['thrust_to_weight'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'type': type,
      'version': version,
      'layout': layout,
      'engine_loss_max': engineLossMax,
      'propellant_1': propellant_1,
      'propellant_2': propellant_2,
      'thrust_to_weight': thrustToWeight,
    };
  }

  @override
  List<Object> get props {
    return [
      number,
      type,
      version,
      layout,
      engineLossMax,
      propellant_1,
      propellant_2,
      thrustToWeight,
    ];
  }
}
