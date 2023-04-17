import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/helper/widgets/common_textfield.dart';
import 'package:epic_multivendor/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_color.dart';
import '../profile_provider.dart';

class UpdateProfileUI extends StatefulWidget {
  const UpdateProfileUI({Key? key}) : super(key: key);

  @override
  State<UpdateProfileUI> createState() => _UpdateProfileUIState();
}

class _UpdateProfileUIState extends State<UpdateProfileUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    ProfileProvider myProfilePROV = context.watch<ProfileProvider>();
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.close,
              color: AppColors.white,
            )),
        title: Text(
          'Update Account',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: AppColors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textField(context,
                initialValue: userModel.name,
                    text: "Name",
                    onChanged: (val){
                     userModel.updateWith(name: val);
                    }),
                const SizedBox(
                  height: 5,
                ),
                textField(context,
                    initialValue: userModel.email,
                    text: "Email",
                    onChanged: (val){
                      userModel.updateWith(email: val);
                    }),
                const SizedBox(
                  height: 5,
                ),
                textField(context,
                    initialValue: userModel.phone,
                    text: "Phone",
                    keyboardType: TextInputType.number,
                    onChanged: (val){
                      userModel.updateWith(phone: val);
                    }),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  onPressed: () {
                    myProfilePROV.updateMyProfileFUNC(
                      userId: userModel.userId,
                      name: userModel.name,
                      phone: userModel.phone,
                      email: userModel.email
                    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile(),)));
                  },
                  text: "Update",
                  color: AppColors.white,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  textField(context, {initialValue, text, void Function(String)? onChanged, keyboardType}) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: const EdgeInsets.only(left: 10),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
