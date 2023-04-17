import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssetsImages{
  static const String splash= "assets/splash.png";
  static const String login= 'assets/login.png';
  static const String noProduct = 'assets/No data2.gif';
  static const String noService = 'assets/No data.gif';
  static const String noProduct1 = 'assets/noproduct.png';
  static const String noService1 = 'assets/noservices.png';
  static const String noImges2 = 'assets/No data.gif';
  static const String product = "assets/product.png";
  static const String service = "assets/service.png";
  static const String primetop = "assets/Group 555.png";
   static const String primeBottom = "assets/Group 550.png";
}
class AppNetWorkImage{
  static const String productNetWork = "https://th.bing.com/th/id/OIP.wve-0jXjo3jOQXInU0rR5AHaER?pid=ImgDet&w=750&h=432&rs=1";
  static const String serviceNetWork =  "https://th.bing.com/th/id/OIP._UkmKy0XcG2r-TKlb_eEogHaFj?pid=ImgDet&w=1200&h=899&rs=1";
}

class AppSvgImages{
  static const String epic = "assets/svg/epic.svg";
  static const String greenEpic ="assets/svg/greenEpic.svg";
  static const String prime ="assets/svg/Vector.svg";
  static const String notification ="assets/svg/BellSimple.svg";
  
  
}

SvgImage(image, context, {size}) {
  return SvgPicture.asset(image.toString(),
      height: size,
      width: size,
      theme:  const SvgTheme(fontSize: 14.0, xHeight: 7.0,currentColor: Color(0xff000000),),
      placeholderBuilder: (BuildContext context) =>
      const CupertinoActivityIndicator());
}
SvgImageGreen(image, context, {size}) {
  return SvgPicture.asset(image.toString(),
      height: size,
      width: size,
      theme:  SvgTheme(fontSize: 14.0, xHeight: 7.0,currentColor: AppColors.primaryGreen,),
      placeholderBuilder: (BuildContext context) =>
      const CupertinoActivityIndicator());
}