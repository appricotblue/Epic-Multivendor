import 'dart:convert';
import 'package:epic_multivendor/helper/helper_routes.dart';
import 'package:epic_multivendor/screens/checkout/checkout_provider.dart';
import 'package:epic_multivendor/screens/checkout/shop_checkout/shop_checkout.dart';
import 'package:epic_multivendor/screens/home/home.dart';
import 'package:epic_multivendor/screens/shops/shop_category/shop_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/model/user_model.dart';
import '../../../map/location_provider.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // PickResult? selectedPlace;
  var userModel = Get.find<UserModel>();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    var locationprovider = Provider.of<LocationProvider>(context);
    CheckoutProvider checkoutProvider = context.watch<CheckoutProvider>();
    return Scaffold(
      // body: PlacePicker(
      //   apiKey: "AIzaSyCdnFSCwn2gVFH5T3aIoc9w3vQCYILdvbo",
      //   useCurrentLocation: true,
      //   initialPosition: const LatLng(9.9312328, 76.26730410000005),
      //   forceSearchOnZoomChanged: true,
      //   hintText: "Find a place ...",
      //   searchingText: "Please wait ...",
      //   selectInitialPosition: true,
      //   usePinPointingSearch: true,
      //   usePlaceDetailSearch: true,
      //   selectedPlaceWidgetBuilder: (
      //       _,
      //       selectedPlace,
      //       state,
      //       isSearchBarFocused,
      //       ) {
      //     return isSearchBarFocused
      //         ? Container()
      //         : FloatingCard(
      //       bottomPosition: 0.0,
      //       leftPosition: 0.0,
      //       rightPosition: 0.0,
      //       child: state == SearchingState.Searching
      //           ? Container()
      //           : Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           selectedPlace == null
      //               ? Container()
      //               : Container(
      //             height: 130,
      //             padding: const EdgeInsets.all(16),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Text(
      //                   selectedPlace.formattedAddress
      //                       .toString(),
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       fontSize: 14,
      //                       color: AppColors.black,
      //                       fontWeight: FontWeight.bold),
      //                 ),
      //                 const SizedBox(height: 8),
      //                 MaterialButton(
      //                   onPressed: () async {
      //                    checkoutProvider.addLat(selectedPlace
      //                         .geometry!.location.lat
      //                         .toString());
      //                    checkoutProvider.addLng(selectedPlace
      //                         .geometry!.location.lng
      //                         .toString());
      //                    checkoutProvider.addPlaceName(selectedPlace
      //                         .formattedAddress
      //                         .toString());
      //                    userModel.updateWith(
      //                      placeName: selectedPlace.formattedAddress.toString(),
      //                      lat: selectedPlace.geometry!.location.lat.toString(),
      //                      lng: selectedPlace.geometry!.location.lng.toString(),);
      //                     // Future.delayed(
      //                     //     const Duration(
      //                     //         milliseconds: 2000), () {
      //                     Navigator.pushReplacement(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) =>
      //                           const ShopCheckOut(isAdrress: "true"),
      //                         ));

      //                     // });

                       
      //                   },
      //                   // ignore: sort_child_properties_last
      //                   child: Text(
      //                     "Submit",
      //                     style: Theme.of(context)
      //                         .textTheme
      //                         .bodyText1
      //                         ?.copyWith(
      //                         color: AppColors.white),
      //                   ),
      //                   minWidth: 200,
      //                   height: 45,
      //                   shape: RoundedRectangleBorder(
      //                       borderRadius:
      //                       BorderRadius.circular(20)),
      //                   color: AppColors.primaryGreen,
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
        //  body: PlacePicker(
        
        // selectInitialPosition: true,
        //   apiKey: "AIzaSyCdnFSCwn2gVFH5T3aIoc9w3vQCYILdvbo",
        //   onPlacePicked: (result) async {
        //     if (result.formattedAddress == null) {
        //       return;
        //     }
        //       checkoutProvider.addLat(result
        //                       .geometry!.location.lat
        //                       .toString());
        //                  checkoutProvider.addLng(result
        //                       .geometry!.location.lng
        //                       .toString());
        //                  checkoutProvider.addPlaceName(result
        //                       .formattedAddress
        //                       .toString());
        //                  userModel.updateWith(
        //                    placeName: result.formattedAddress.toString(),
        //                    lat: result.geometry!.location.lat.toString(),
        //                    lng: result.geometry!.location.lng.toString(),);
        //                   // Future.delayed(
        //                   //     const Duration(
        //                   //         milliseconds: 2000), () {
        //                   Navigator.pushReplacement(
        //                       context,
        //                       MaterialPageRoute(
        //                         builder: (context) =>
        //                         const ShopCheckOut(isAdrress: "true"),
        //                       ));

        //                   // });

        //   },
        //            initialPosition:  LatLng(10.0159,76.3419),
        //   useCurrentLocation: true,
        //   resizeToAvoidBottomInset:
        //       false, // only works in page mode, less flickery, remove if wrong offsets
        // ),
        body: locationprovider.position == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FlutterLocationPicker(
                initPosition: LatLong(locationprovider.position!.latitude,
                    locationprovider.position!.longitude),
                selectLocationButtonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                selectedLocationButtonTextstyle:
                    const TextStyle(fontSize: 18, color: Colors.white),
                selectLocationButtonText: 'Set Current Location',
                selectLocationButtonLeadingIcon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                initZoom: 11,
                minZoomLevel: 5,
                maxZoomLevel: 16,
                trackMyPosition: true,
                onError: (e) => print(e),
                onPicked: (result) async {
                       if (result.address == null) {
              return;
            }
              checkoutProvider.addLat(result.latLong.latitude.toString());
                         checkoutProvider.addLng(result.latLong.longitude.toString());
                         checkoutProvider.addPlaceName(result
                              .address
                              .toString());
                         userModel.updateWith(
                           placeName: result.address.toString(),
                           lat: result.latLong.latitude.toString(),
                           lng: result.latLong.longitude.toString(),);
                          // Future.delayed(
                          //     const Duration(
                          //         milliseconds: 2000), () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ShopCheckOut(isAdrress: "true"),
                              ));

                          // });
                },
                onChanged: (pickedData) {
                  print(pickedData.latLong.latitude);
                  print(pickedData.latLong.longitude);
                  print(pickedData.address);
                  print(pickedData.addressData);
                }),
    );
  }
}
