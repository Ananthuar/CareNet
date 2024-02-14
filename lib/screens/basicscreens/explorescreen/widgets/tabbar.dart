import 'package:carenet/screens/basicscreens/explorescreen/explorables/individuals.dart';
import 'package:carenet/screens/basicscreens/explorescreen/explorables/organisations.dart';
import 'package:flutter/material.dart';

class IndexTabBar extends StatelessWidget {
  const IndexTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar:  AppBar(
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.corporate_fare
                ),
                text: 'Organisations',
              ),
              Tab(
                icon: Icon(
                  Icons.person
                ),
                text: 'Individuals',
              ),
            ],
          ),
        ),
        body: const SafeArea(
          bottom: true,
          child: TabBarView(
            children: [
              OrganisationScreen(),
              IndividualScreen(),
            ],
          ),
        ),
      
      ),
    );
  }
}