import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_service_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchServices extends StatelessWidget {
  const SearchServices({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
         child: const SearchServiceUI());
  }
}
