part of 'population_cubit.dart';

@immutable
sealed class PopulationState {}

final class PopulationInitial extends PopulationState {}
final class Populationloaded extends PopulationState {
  final Welcome data;
  Populationloaded({required this.data});
}
final class Populationloading extends PopulationState {}
final class Populationerror extends PopulationState {
 final String error;
 Populationerror({required this.error});
}
