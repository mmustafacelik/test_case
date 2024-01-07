import 'package:appnation_test_case/models/dog_species_model.dart';
import 'package:appnation_test_case/models/dog_type_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = "https://dog.ceo/api/";
  Future<DogSpeciesModel> fetchDogSpeciesList() async {
    try {
      Response response = await _dio.get('${_baseUrl}breeds/list/all');
      return DogSpeciesModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return DogSpeciesModel.withError("Data not found / Connection issue");
    }
  }

  Future<DogTypeModel> fetchDogPhotosList({required String type}) async {
    try {
      Response response = await _dio.get('${_baseUrl}breed/$type/images');
      // print('a' + response.data.toString());
      return DogTypeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return DogTypeModel.withError("Data not found / Connection issue");
    }
  }
}

class NetworkError extends Error {}
