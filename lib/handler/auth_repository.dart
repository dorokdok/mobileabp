import '../data/net/base.dart';
import '../data/net/api_services.dart';
import '../data/API/endpoint.dart';

class AuthRepository {
  BaseApi apiServices = ApiServices();

  Future<dynamic> login(dynamic data) async {
    dynamic response = await apiServices.post(Endpoint.loginUrl, data);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> get_profile() async {
    dynamic response = await apiServices.get(Endpoint.profileUrl);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> logout() async {
    dynamic response = await apiServices.post(Endpoint.logoutUrl, null);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
