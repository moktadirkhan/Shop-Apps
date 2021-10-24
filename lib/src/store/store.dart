import 'package:shop_app/src/mockdata/appdata_mock_data.dart';
import 'package:shop_app/src/models/appData.dart';

class Store {
  AppData _appData = AppData();
  static final Store _instance = Store();
  static Store get instance => _instance;

  Future<void> initStore() async {
    await _loadAppData();
  }

  Future<void> _loadAppData() async {
    _appData = AppDataResponse.getAppData();
  }

  AppData getAppData() {
    return _appData;
  }
}
