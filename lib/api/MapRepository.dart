import 'package:dio/dio.dart';
import 'package:ft_practice/api/Constants.dart';
import 'package:ft_practice/api/model/GoogleMapModel.dart';

class MapRepository {
  static Future<GoogleMapModel> getPlaceDetail(String id) async {
    final response = await Dio().get(
      API_MAP_BASE_URL,
      queryParameters: {
        'place_id': id,
        'language': "ko",
        'key': API_KEY_GOOGLE,
      },
    );

    print("GoogleMap api response: ${response.data['result'].toString()}");

    return GoogleMapModel.fromJson(response.data['result']);
  }
}
