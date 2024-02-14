import 'package:carenet/screens/basicscreens/donationscreen/donationscreen.dart';
import 'package:carenet/screens/basicscreens/explorescreen/explorescreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/homescreen.dart';
import 'package:carenet/screens/basicscreens/requestscreen/requestscreen.dart';
import 'package:carenet/screens/indexscreen/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

//making array for basic screens
  final _pages=const [
    HomeScreen(),
    ExploreScreen(),
    RequestScreen(),
    DonationsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(  
      
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index, _) {
        return _pages[index];
      },),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}