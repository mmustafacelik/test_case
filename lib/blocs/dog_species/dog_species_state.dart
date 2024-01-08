import 'package:appnation_test_case/models/dog_species_model.dart';
import 'package:equatable/equatable.dart';

abstract class DogSpeciesState extends Equatable {
  const DogSpeciesState();

  @override
  List<Object?> get props => [];
}

class DogSpeciesInitial extends DogSpeciesState {}

class DogSpeciesLoading extends DogSpeciesState {}

class DogSpeciesLoaded extends DogSpeciesState {
  final DogSpeciesModel dogSpeciesModel;
  @override
  List<Object?> get props => [dogSpeciesModel];
  const DogSpeciesLoaded(this.dogSpeciesModel);
}

class DogSpeciesSearchLoaded extends DogSpeciesState {
  final DogSpeciesModel dogSpeciesModel;
  @override
  List<Object?> get props => [dogSpeciesModel];
  const DogSpeciesSearchLoaded(this.dogSpeciesModel);
}

class DogSpeciesError extends DogSpeciesState {
  final String? message;
  const DogSpeciesError(this.message);
}
