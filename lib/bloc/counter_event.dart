import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class DecrementEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}
