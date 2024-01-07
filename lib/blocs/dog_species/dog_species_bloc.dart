import 'dart:math';

import 'package:appnation_test_case/blocs/dog_species/dog_species_events.dart';
import 'package:appnation_test_case/blocs/dog_species/dog_species_state.dart';
import 'package:appnation_test_case/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogSpeciesBloc extends Bloc<DogSpeciesEvent, DogSpeciesState> {
  DogSpeciesBloc() : super(DogSpeciesInitial()) {
    on<GetDogSpeciesList>(getDogSpeciesList);
    add(const GetDogSpeciesList()); //bloc başlatıldığında ilk olarak bu eventi tetikler
  }
}

Future<void> getDogSpeciesList(
    GetDogSpeciesList event, Emitter<DogSpeciesState> emit) async {
  final ApiProvider _apiRepository = ApiProvider();
  try {
    emit(DogSpeciesLoading());
    final mList = await _apiRepository.fetchDogSpeciesList();
    for (var element in mList.message?.keys ?? <String>[]) {
      final pList = await _apiRepository.fetchDogPhotosList(type: element);
      mList.photo ??= <String, String>{};
      mList.photo?[element] =
          pList.message![Random().nextInt(pList.message!.length)];
    }

    emit(DogSpeciesLoaded(mList));

    if (mList.error != null) {
      emit(DogSpeciesError(mList.error));
    }
    // FlutterNativeSplash.remove();
  } on NetworkError {
    emit(const DogSpeciesError("Failed to fetch data. is your device online?"));
  }
}
