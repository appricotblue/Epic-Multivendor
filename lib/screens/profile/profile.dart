import 'package:epic_multivendor/screens/profile/profile_provider.dart';
import 'package:epic_multivendor/screens/profile/ui/profile_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(), child: MyProfile());
  }
}
