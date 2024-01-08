import 'package:equatable/equatable.dart';

abstract class DogSpeciesEvent extends Equatable {
  const DogSpeciesEvent();

  @override
  List<Object> get props => [];
}

class GetDogSpeciesList extends DogSpeciesEvent {
  const GetDogSpeciesList();
}

class GetDogSpeciesSearchEvent extends DogSpeciesEvent {
  final String search;
  const GetDogSpeciesSearchEvent(
    this.search,
  );
}
