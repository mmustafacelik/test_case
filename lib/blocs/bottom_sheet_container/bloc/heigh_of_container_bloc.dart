import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'heigh_of_container_event.dart';
part 'heigh_of_container_state.dart';

class HeighOfContainerBloc
    extends Bloc<HeighOfContainerEvent, HeighOfContainerState> {
  HeighOfContainerBloc() : super(const HeighOfContainerState(100)) {
    on<HeighOfContainerEvent>(mapEventToState);
  }

  void mapEventToState(
    HeighOfContainerEvent event,
    Emitter<HeighOfContainerState> emit,
  ) {
    if (event is HeighIncremented) {
      emit(HeighOfContainerState(800));
      print(state.value);
    } else if (event is HeighDecremented) {
      emit(HeighOfContainerState(100));
      print(state.value);
    }
  }
}
