part of 'heigh_of_container_bloc.dart';

sealed class HeighOfContainerEvent extends Equatable {
  const HeighOfContainerEvent();

  @override
  List<Object> get props => [];
}

class HeighIncremented extends HeighOfContainerEvent {
  final double heigh;

  const HeighIncremented(this.heigh);

  @override
  List<Object> get props => [heigh];
}

class HeighDecremented extends HeighOfContainerEvent {
  final double height;

  const HeighDecremented(this.height);

  @override
  List<Object> get props => [height];
}
