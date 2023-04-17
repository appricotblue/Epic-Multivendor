import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_color.dart';

class TermsUI extends StatefulWidget {
  const TermsUI({super.key});

  @override
  State<TermsUI> createState() => _TermsUIState();
}

class _TermsUIState extends State<TermsUI> {
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
          title: Text("Terms and  Conditions",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,color: AppColors.white),),
        ),
        body:value.isLoading?const  SizedBox(width:25,height: 25, child: CircularProgressIndicator()): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:Provider.of<SplashProvider>(context, listen: false).settingsModel?.termsAndCondtions != null?
            HtmlWidget(
              '''
           ${Provider.of<SplashProvider>(context, listen: false).settingsModel?.termsAndCondtions} 
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
