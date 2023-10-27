import 'package:dio/dio.dart';
import 'package:ft_practice/api/Constants.dart';
import 'package:ft_practice/api/model/YoutubeModel.dart';

class YoutubeRepository {
  static Future<YoutubeModel> getYoutubeInfo(String id) async {
    final response = await Dio().get(
      YOUTUBE_API_BASE_URL,
      queryParameters: {
        'part': "snippet",
        'id': id,
        'key': API_KEY_GOOGLE,
      },
    );

    print("Youtube api response: ${response.data["items"][0].toString()}");

    return YoutubeModel.fromJson(response.data["items"][0]);
  }
}

