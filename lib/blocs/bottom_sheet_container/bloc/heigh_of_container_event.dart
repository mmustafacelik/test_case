part of 'heigh_of_container_bloc.dart';

sealed class HeighOfContainerEvent extends Equatable {
  const HeighOfContainerEvent();

  @override
  List<Object> get props => [];
}

class HeighIncremented extends HeighOfContainerEvent {}

class HeighDecremented extends HeighOfContainerEvent {}
