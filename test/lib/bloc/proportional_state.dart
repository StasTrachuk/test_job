import 'package:test/model/component.dart';

sealed class ProportionalState {}

class ProportionalInitial extends ProportionalState {}

class ProportionalLoading extends ProportionalState {}

class ProportionalLoaded extends ProportionalState {
  final List<Component> components;
  ProportionalLoaded(this.components);
}

class ProportionalError extends ProportionalState {
  String error;
  ProportionalError(this.error);
}
