import 'package:dio/dio.dart';

class ProjectNetworkManager {
  final _baseUrl = "https://rickandmortyapi.com/api";
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = ProjectNetworkManager._init();
    return _instance!;
  }

  late final Dio dio;
  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}
