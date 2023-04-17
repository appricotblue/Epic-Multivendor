import 'package:epic_multivendor/screens/profile/ui/profile_ui.dart';
import 'package:epic_multivendor/screens/profile/ui/update_profile_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../profile_provider.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(), child: UpdateProfileUI());
  }
}