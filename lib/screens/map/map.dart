import 'package:epic_multivendor/screens/bottom/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/helper_color.dart';
import '../../helper/model/user_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  PickResult? selectedPlace;
  var userModel = Get.find<UserModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: "AIzaSyDgK3yfCW3yF9lH5Mp7sDP48wvWRA7oy_0",
        useCurrentLocation: true,
        initialPosition: const LatLng(9.9312328, 76.26730410000005),
        forceSearchOnZoomChanged: true,
        hintText: "Find a place ...",
        searchingText: "Please wait ...",
        selectedPlaceWidgetBuilder: (
          _,
          selectedPlace,
          state,
          isSearchBarFocused,
        ) {
          return isSearchBarFocused
              ? Container()
              : FloatingCard(
                  bottomPosition: 0.0,
                  leftPosition: 0.0,
                  rightPosition: 0.0,
                  child: state == SearchingState.Searching
                      ? Container()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                    height: 170,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          selectedPlace!.formattedAddress
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        MaterialButton(
                                          onPressed: () async {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString(
                                                "placeName",
                                                selectedPlace.formattedAddress
                                                    .toString());
                                            prefs.setString(
                                                "lat",
                                                selectedPlace
                                                    .geometry!.location.lat
                                                    .toString());
                                            prefs.setString(
                                                "lng",
                                                selectedPlace
                                                    .geometry!.location.lng
                                                    .toString());
                                            userModel.updateWith(
                                                placeName: selectedPlace.formattedAddress.toString(),
                                                lat: selectedPlace.geometry!.location.lat.toString(),
                                                lng: selectedPlace.geometry!.location.lng.toString(),);
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 2000), () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BottomBarScreen(),
                                                  ));
                                            });
                                          },
                                          // ignore: sort_child_properties_last
                                          child: Text(
                                            "Submit",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    color: AppColors.white),
                                          ),
                                          minWidth: 200,
                                          height: 45,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          color: AppColors.primaryGreen,
                                        )
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                );
        },
      ),
    );
  }
}
