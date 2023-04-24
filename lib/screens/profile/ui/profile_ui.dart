import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/about/about.dart';
import 'package:epic_multivendor/screens/contact/contact.dart';
import 'package:epic_multivendor/screens/my_order&services/my_order&service.dart';
import 'package:epic_multivendor/screens/profile/profile_provider.dart';
import 'package:epic_multivendor/screens/profile/ui/update_profile.dart';
import 'package:epic_multivendor/screens/profile/ui/update_profile_ui.dart';
import 'package:epic_multivendor/screens/terms/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    ProfileProvider myProfilePROV = context.watch<ProfileProvider>();
    return WillPopScope(
       onWillPop: () async {
         await SystemNavigator.pop();
         return true;
      },
      child: Scaffold(
          backgroundColor: AppColors.primaryGreen,
          appBar: AppBar(
            backgroundColor: AppColors.primaryGreen,
            elevation: 0,
            leading: InkWell(
                onTap: () async{
                       await SystemNavigator.pop();
                    },
                child: Icon(
                  Icons.close,
                  color: AppColors.white,
                )),
            title: Text(
              'My Account',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: AppColors.white,
                  ),
            ),
          ),
        body:myProfilePROV.isLoading?Center(child: CircularProgressIndicator(color: AppColors.primaryGreen,),): SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.white,
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                            "https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png",
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => ShimmerLoader()
                                .shimmerImageProduct(context, width: 50.0),
                            errorWidget: (context, url, error) => Image.asset(
                              AppAssetsImages.noProduct1,
                              height: 100,
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(myProfilePROV.myProfileModel?.profileData?.name ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: AppColors.white,
                          ),
                        ),
                        Text(myProfilePROV.myProfileModel?.profileData?.phone ?? "",
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: AppColors.white,
                          ),
                        ),
                        Text(myProfilePROV.myProfileModel?.profileData?.email ?? "",
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 30,
                    child: IconButton(
                        onPressed: () {
                          userModel.updateWith(
                            name: myProfilePROV.myProfileModel?.profileData?.name,
                            phone: myProfilePROV.myProfileModel?.profileData?.phone,
                            email: myProfilePROV.myProfileModel?.profileData?.email
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile()));
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 15,
                          color: AppColors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 420,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: AppColors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.shop,color: AppColors.lightGrey,),
                  title: Text(
                    'My Orders',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderServices(),));
                  },
                ),
                  ListTile(
                    leading: Icon(Icons.contact_mail,color: AppColors.lightGrey,),
                  title: Text(
                    'Contact us',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                   onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Contact(),));
                  },
                ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip,color: AppColors.lightGrey,),
                  title: Text(
                    'Terms and conditions',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Terms(),));
                  },
                ),
                  ListTile(
                    leading: Icon(Icons.person,color: AppColors.lightGrey,),
                  title: Text(
                    'About us',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => About(),));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout,color: AppColors.lightGrey,),
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                  onTap: () => myProfilePROV.logout(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<ProfileProvider>().myProfileFUNC(userModel.userId);
    });
    super.initState();
  }
}
