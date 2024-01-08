import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'heigh_of_container_event.dart';
part 'heigh_of_container_state.dart';

class HeighOfContainerBloc
    extends Bloc<HeighOfContainerEvent, HeighOfContainerState> {
  HeighOfContainerBloc() : super(const HeighOfContainerState(300)) {
    on<HeighOfContainerEvent>(mapEventToState);
  }

  void mapEventToState(
    HeighOfContainerEvent event,
    Emitter<HeighOfContainerState> emit,
  ) {
    if (event is HeighIncremented) {
      emit(HeighOfContainerState(event.heigh));
    } else if (event is HeighDecremented) {
      emit(HeighOfContainerState(event.height));

      print(state.value);
    }
  }
}
