import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String _storageAppConfig = 'AppConfig';
const String _storageAuthConfig = 'AuthConfig';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init(_storageAppConfig);
    // appConfig.remove('active_theme');
    await GetStorage.init(_storageAuthConfig);
    return this;
  }

  final GetStorage _appConfig = GetStorage(_storageAppConfig);
  final GetStorage _authConfig = GetStorage(_storageAuthConfig);

  int get activeThemeId => _appConfig.read('active_theme') ?? 1;
  set activeThemeId(int value) => _appConfig.write('active_theme', value);

  String? get authToken => _authConfig.read('auth_token') as String?;
  set authToken(String? value) => _authConfig.write('auth_token', value);
}
