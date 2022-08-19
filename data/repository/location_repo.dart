import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/models/adress_model.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefs;
  LocationRepo({required this.apiClient, required this.sharedPrefs});

  Future<Response> getAddresFromGeocode(LatLng latLng)async{
    return await apiClient.getData('${AppConstants.GEOCODE_URI}?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress(){
    return sharedPrefs.getString(AppConstants.USER_ADDRESS)??'';
  }

  Future<Response> addAddress(AdressModel addressModel) async {
    return await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {
    return await apiClient.getData(AppConstants.ADDRESS_LIST_URI);
  }

  Future<bool> saveUserAddress(String address) async {
    //apiClient.updateHeader(sharedPrefs.getString(AppConstants.TOKEN)!);
    return await sharedPrefs.setString(AppConstants.USER_ADDRESS, address);
  }

  Future<Response> getZone(String lat, String lng) async {
    return await apiClient.getData('${AppConstants.ZONE_URI}?lat=$lat&lng=$lng');
  }

  Future<Response> searchLocation(String text) async {
    return await apiClient.getData('${AppConstants.SEARCH_LOCATION_URI}?search_text=$text');
  }
  
  Future<Response> setLocation(String placeId) async {
    return await apiClient.getData('${AppConstants.PLACE_DETAILS_URI}?placeid=$placeId');
  }
}