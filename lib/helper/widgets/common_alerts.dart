import 'package:epic_multivendor/helper/helper_routes.dart';
import 'package:epic_multivendor/screens/map/map.dart';
import 'package:flutter/material.dart';

import '../helper_color.dart';

class AlertForLocationMissing extends StatefulWidget {
  const AlertForLocationMissing({super.key});

  @override
  State<AlertForLocationMissing> createState() =>
      _AlertForLocationMissingState();
}

class _AlertForLocationMissingState extends State<AlertForLocationMissing> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor:AppColors.scaffoldGreen,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:AppColors.scaffoldGreen,),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "Location Missing",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.primaryGreen),
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please Update Your Location",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.primaryGreen),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MapPage(),)),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryGreen,
                        ),
                        child: Center(
                            child: Text(
                          "Get Location",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.white),
                        )),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
