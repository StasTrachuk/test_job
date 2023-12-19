import 'package:flutter/material.dart';

class Component {
  final String description;
  final double value;
  final Color? color;
  final double? percent;

  const Component({
    required this.description,
    required this.value,
    this.color,
    this.percent,
  });

  Component copyWith({Color? color, double? percent}) {
    return Component(
      description: description,
      value: value,
      color: color ?? this.color,
      percent: percent ?? this.percent,
    );
  }
}
