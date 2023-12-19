import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/proportional_state.dart';
import 'package:test/model/component.dart';

class ProportionalCubit extends Cubit<ProportionalState> {
  final List<Component> _components = [
    const Component(description: 'Body', value: 20),
    const Component(description: 'Mind', value: 35),
    const Component(description: 'Spirit', value: 70),
  ];

  ProportionalCubit() : super(ProportionalInitial()) {
    _getComponents();
  }

  void removeComponent() {
    emit(ProportionalLoading());
    try {
      _components.removeLast();
      _setPercentAndColor();
      emit(ProportionalLoaded(_components));
    } catch (e) {
      emit(ProportionalError(e.toString()));
    }
  }

  void addComponent() {
    emit(ProportionalLoading());
    try {
      _components.add(
        Component(
          description: 'Body',
          value: Random().nextInt(300) / 1,
        ),
      );
      _setPercentAndColor();
      emit(ProportionalLoaded(_components));
    } catch (e) {
      emit(ProportionalError(e.toString()));
    }
  }

  void _getComponents() {
    emit(ProportionalLoading());
    try {
      _setPercentAndColor();
      emit(ProportionalLoaded(_components));
    } catch (e) {
      emit(ProportionalError(e.toString()));
    }
  }

  void _setPercentAndColor() {
    //сортуєм список від найбільшого до найменшого
    _components.sort(
      ((a, b) => b.value.compareTo(a.value)),
    );

    //рахуєм суму всіх значеннь
    double sum = 0;
    for (Component component in _components) {
      sum = sum + component.value;
    }

    //рахуєм відсоток для кожного компонента та задаємо колір
    for (int i = 0; i < _components.length; i++) {
      final percent = (_components[i].value * 100) / sum;

      _components[i] = _components[i].copyWith(
        color: BarColors.getColor(i),
        percent: percent,
      );
    }
  }
}

class BarColors {
  static const _componentColors = [
    Color(0xFFFF6347),
    Color(0xFFDA70D6),
    Color(0xFF7FFF00),
    Color(0xFFFFD700),
    Color(0xFF00CED1),
    Color(0xFFFF4500),
    Color(0xFF9370DB),
    Color(0xFF20B2AA),
    Color(0xFF8B008B),
    Color(0xFF8B4513),
    Color(0xFF00FA9A),
  ];

  static Color getColor(int index) {
    return _componentColors[index];
  }
}
