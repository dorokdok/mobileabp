import '../data/net/base.dart';
import '../data/net/api_services.dart';
import '../data/API/endpoint.dart';

class LocationRepository {
  BaseApi apiServices = ApiServices();

  Future<dynamic> get_storage() async {
    dynamic response = await apiServices.get(Endpoint.storageUrl);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> update_item_storage(dynamic data, String id) async {
    dynamic response =
        await apiServices.post('${Endpoint.locationUpdateUrl}/$id', data);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
