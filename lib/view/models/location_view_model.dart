import 'package:flutter/material.dart';
import '../../models/class/warehouse_storage.dart';
import '../../models/response/storage_response.dart';
import '../../handler/location_repository.dart';

class LocationViewModel with ChangeNotifier {
  final repo = LocationRepository();

  // State
  bool _is_loading = false;
  bool _is_error = false;
  List<WarehouseStorage>? _storages;

  bool get is_loading => _is_loading;
  bool get is_error => _is_error;
  List<WarehouseStorage>? get storages => _storages;

  setLoading(bool state) {
    _is_loading = state;
    notifyListeners();
  }

  setError(bool state) {
    _is_error = state;
    notifyListeners();
  }

  setStorages(List<WarehouseStorage>? storages) {
    _storages = storages;
    notifyListeners();
  }

  Future<void> get_storage() async {
    setLoading(true);
    setError(false);

    repo.get_storage().then((value) async {
      setLoading(false);

      // Saving the data
      setStorages(StorageResponse.fromJson(value).data);
    }).onError((error, stackTrace) {
      setLoading(false);
      setError(true);
    });
  }

  Future<void> update_storage_stock(
      dynamic data, String id, BuildContext context) async {
    setLoading(true);
    setError(false);

    repo.update_item_storage(data, id).then((value) async {
      setLoading(false);

      Navigator.pop(context);
    }).onError((error, stackTrace) {
      setLoading(false);
      setError(true);
    });
  }
}
