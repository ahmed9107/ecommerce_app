import 'package:store_app/data/api/api_client.dart';
import 'package:store_app/models/adress_model.dart';
import 'package:store_app/utils/constants/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefs;
  LocationRepo({required this.apiClient, required this.sharedPrefs});
  
  getAddresFromGeocode(LatLng latLng)async{
    var response = await apiClient.getDataFromGoogleMap('https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=AIzaSyAox1Gx4-mq8It5hCsuGz-B058BD7ia154');
    return response.fold((l) => l, (r) => r);
  }

  String getUserAddress(){
    return sharedPrefs.getString(AppConstants.USER_ADDRESS)??'';
  }

  addAddress(AdressModel addressModel) async {
    var response = await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
    return response.fold((l) => l, (r) => r);
  }

  getAllAddress(String userId) async {
    var response = await apiClient.postData(AppConstants.ADDRESS_LIST_URI, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  Future<bool> saveUserAddress(String address) async {
    //apiClient.updateHeader(sharedPrefs.getString(AppConstants.TOKEN)!);
    return await sharedPrefs.setString(AppConstants.USER_ADDRESS, address);
  }

  /* getZone(String lat, String lng) async {
    return await apiClient.getData('${AppConstants.ZONE_URI}?lat=$lat&lng=$lng');
  } */

  searchLocation(String text) async {
    var response = await apiClient.getDataFromGoogleMap('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=AIzaSyAox1Gx4-mq8It5hCsuGz-B058BD7ia154');
    return response.fold((l) => l, (r) => r);
  }

  setLocation(String placeId) async {
    var response = await apiClient.getDataFromGoogleMap('https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=AIzaSyAox1Gx4-mq8It5hCsuGz-B058BD7ia154');
    return response.fold((l) => l, (r) => r);
  }
}