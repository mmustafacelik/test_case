import 'dart:async';

import 'package:appnation_test_case/blocs/dog_species/dog_species_events.dart';
import 'package:appnation_test_case/blocs/dog_species/dog_species_state.dart';
import 'package:appnation_test_case/models/dog_species_model.dart';
import 'package:appnation_test_case/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogSpeciesBloc extends Bloc<DogSpeciesEvent, DogSpeciesState> {
  DogSpeciesBloc() : super(DogSpeciesInitial()) {
    on<GetDogSpeciesList>(getDogSpeciesList);
    on<GetDogSpeciesSearchEvent>(getDogSpeciesSearchList);
    add(const GetDogSpeciesList()); //bloc başlatıldığında ilk olarak bu eventi tetikler
  }
  DogSpeciesModel? resultSearchList;

  Future<void> getDogSpeciesList(
      GetDogSpeciesList event, Emitter<DogSpeciesState> emit) async {
    final ApiProvider _apiRepository = ApiProvider();
    try {
      emit(DogSpeciesLoading());
      final mList = await _apiRepository.fetchDogSpeciesList();
      for (var element in mList.message?.keys ?? <String>[]) {
        final pList = await _apiRepository.fetchDogPhotosList(type: element);
        mList.photo ??= <String, List<String>>{};
        mList.photo?[element] = pList.message ?? <String>[];
      }
      print(mList.photo);

      resultSearchList = mList;
      emit(DogSpeciesLoaded(mList));

      if (mList.error != null) {
        emit(DogSpeciesError(mList.error));
      }
    } on NetworkError {
      emit(const DogSpeciesError(
          "Failed to fetch data. is your device online?"));
    }
  }

  Future<void> getDogSpeciesSearchList(
      GetDogSpeciesSearchEvent event, Emitter<DogSpeciesState> emit) async {
    emit(DogSpeciesLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    if (resultSearchList == null) {
      return;
    }
    if (event.search.isEmpty) {
      emit(DogSpeciesLoaded(resultSearchList!));
      return;
    }
    var searchList = DogSpeciesModel(
        photo: Map<String, List<String>>(),
        error: resultSearchList!.error,
        message: Map<String, List<String>>(),
        status: resultSearchList!.status);
    resultSearchList?.message?.forEach((key, value) {
      if (key.toLowerCase().contains(event.search.toLowerCase())) {
        searchList.message?[key] = value;
        searchList.photo?[key] = resultSearchList!.photo![key]!;
      }
    });
    print(searchList.message);
    emit(DogSpeciesSearchLoaded(searchList));
  }
}
