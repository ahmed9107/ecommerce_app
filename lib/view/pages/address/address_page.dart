import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/controller/location_controller.dart';
import 'package:store_app/models/adress_model.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/pages/address/pick_address_map.dart';
import 'package:store_app/view/widgets/address_widgets/address_info.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPage extends GetWidget<LocationController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (userController) {
          if(controller.adressList.isNotEmpty){
            controller.addressController.text = controller.getUserAddress().adress!;
          }
          return GetBuilder<LocationController>(
            builder: (locationController) {
              locationController.addressController.text = '${locationController.placemark.name??''}${locationController.placemark.locality??''}${locationController.placemark.postalCode??''}${locationController.placemark.country??''}';
              locationController.contactPersonNumberController.text = userController.userPhone;
              locationController.contactPersonNameController.text   = userController.userName;
              
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimensions.height35*9,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius5),
                      ),
                      child: Stack(
                        children: [
                          GoogleMap(
                            onTap: (latLng) {
                              Get.toNamed(
                                AppRoute.getPickAddressPage(),
                                arguments: PickAddressMap(
                                  fromAddress: false,
                                  fromSignup: true,
                                  googleMapController: controller.mapController,
                                ),
                              );
                            },
                            initialCameraPosition: CameraPosition(
                              target: locationController.initialPosition,
                              zoom :17
                            ),
                            zoomControlsEnabled: false,
                            compassEnabled: false,
                            indoorViewEnabled: false,
                            mapToolbarEnabled: false,
                            myLocationEnabled: true,
                            onCameraIdle: (){
                              locationController.updatePosition(locationController.cameraPosition, true);
                            },
                            onCameraMove: (position)=> locationController.cameraPosition = position,
                            onMapCreated: (GoogleMapController mapController){
                              locationController.setMapController(mapController);
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10, top: Dimensions.height20),
                      child: SizedBox(
                        height: Dimensions.height50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: locationController.adressTypeList.length,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){
                                locationController.setAddressTypeIndex(index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height10
                                ),
                                margin: EdgeInsets.only(right: Dimensions.height10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius5),
                                  color:Theme.of(context).backgroundColor,
                                ),
                                child: Icon(
                                  index==0?Icons.home: index ==1 ?Icons.work : Icons.location_on,
                                  color: locationController.addressTypeIndex == index 
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.width20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: BigText(text: '${'address'.tr}:', color: Theme.of(context).primaryColorLight),
                    ),
                    AddressInfoField(
                      hint: 'address'.tr,
                      controller: locationController.addressController,
                      suffixIcon: Icons.map
                    ),
                    SizedBox(height: Dimensions.width10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: BigText(text: '${'contact'.tr}:', color: Theme.of(context).primaryColorLight),
                    ),
                    AddressInfoField(
                      hint: 'name'.tr,
                      controller: locationController.contactPersonNameController,
                      suffixIcon: Icons.person
                    ),
                    SizedBox(height: Dimensions.width10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: BigText(text: 'Contact phone:', color: Theme.of(context).primaryColorLight),
                    ),
                    AddressInfoField(
                      hint: 'Your phone',
                      controller: locationController.contactPersonNumberController,
                      suffixIcon: Icons.phone
                    ),
                  ],
                ),
              );
            }
          );
        }
      ),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (controller) {
          return InkWell(
            onTap: () {
              AdressModel addressModel = AdressModel(
                id: Get.find<UserController>().userId,
                adressType: controller.adressTypeList[controller.addressTypeIndex],
                adress: controller.addressController.text,
                latitude: controller.position.latitude.toString(),
                longitude: controller.position.longitude.toString(),
              );
              controller.addAddress(addressModel);
              /* .then((response) {
                if(response.isSuccess){
                  Get.toNamed(AppRoute.getInitial());
                  Get.snackbar('Address', 'Address added successfully');
                } else {
                  Get.snackbar('Address', 'Couldn\'t save address!');
                }
              }); */
            },
            child: Container(
              margin : EdgeInsets.fromLTRB(Dimensions.width10, 0, Dimensions.width10, 20),
              height: Dimensions.height50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10)),
              child: Center(
                child: BigText(text: 'Save Address', color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          );
        }
      )
    );
  }
}