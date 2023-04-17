import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_color.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, value, child) =>
          Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.primaryGreen,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:  Icon(
                Icons.arrow_back,
                color:  AppColors.white,
                size: 30,
              )),
          title: Text("About Us",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,color: AppColors.white),),
        ),
        body:value.isLoading?const  SizedBox(width:25,height: 25, child: CircularProgressIndicator()): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:Provider.of<SplashProvider>(context, listen: false).settingsModel?.aboutUs != null?
            HtmlWidget(
              '''
           ${Provider.of<SplashProvider>(context, listen: false).settingsModel?.aboutUs} 
             ''',
              textStyle: TextStyle(fontSize: 14,color: AppColors.black),
            ):Container(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<SplashProvider>(context,listen: false).mySettingsFUNC(context);
    super.initState();
  }
}
