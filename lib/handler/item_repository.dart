import '../data/net/base.dart';
import '../data/net/api_services.dart';
import '../data/API/endpoint.dart';

class ItemRepository {
  BaseApi apiServices = ApiServices();

  Future<dynamic> get_item() async {
    dynamic response = await apiServices.get(Endpoint.itemUrl);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> get_item_detail(String id) async {
    dynamic response = await apiServices.get('${Endpoint.itemDetailUrl}/$id');

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> store_item(dynamic data) async {
    dynamic response = await apiServices.post(Endpoint.itemStoreUrl, data);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> update_item(dynamic data, String id) async {
    dynamic response =
        await apiServices.post('${Endpoint.itemUpdateUrl}/$id', data);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> destroy_item(String id) async {
    dynamic response =
        await apiServices.delete('${Endpoint.itemDestroyUrl}/$id');

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
