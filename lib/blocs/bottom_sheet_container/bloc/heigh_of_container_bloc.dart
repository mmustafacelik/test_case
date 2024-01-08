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
      if (state.value >= 900) return;
      emit(HeighOfContainerState(state.value + event.heigh));
    } else if (event is HeighDecremented) {
      if (state.value < event.height) {
        emit(const HeighOfContainerState(0));
      }
      emit(HeighOfContainerState(state.value - event.height));

      print(state.value);
    }
  }
}
