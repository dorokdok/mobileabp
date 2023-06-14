class Endpoint {
  //Ganti sesuai URL
  static var baseUrl = "https://266d-202-80-215-196.ngrok-free.app/api";

  static var loginUrl = "$baseUrl/login";
  static var logoutUrl = "$baseUrl/logout";
  static var profileUrl = "$baseUrl/profile";

  static var itemUrl = "$baseUrl/item";
  static var itemStoreUrl = "$baseUrl/item/store";
  static var itemDetailUrl = "$baseUrl/item/show";
  static var itemUpdateUrl = "$baseUrl/item/update";
  static var itemDestroyUrl = "$baseUrl/item/destroy";

  static var storageUrl = "$baseUrl/storage";
  static var locationUpdateUrl = "$baseUrl/item/location/update";
}
