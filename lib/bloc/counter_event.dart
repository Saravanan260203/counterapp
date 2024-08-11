part of 'counter_bloc.dart';

sealed class CounterEvent {}

class Incremented extends CounterEvent {}

class Decremented extends CounterEvent {}
