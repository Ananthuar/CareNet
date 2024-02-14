import 'package:flutter/material.dart';

//declaring value notifier to notify index change
ValueNotifier<int>indexChangeNotifier=ValueNotifier(0);

//creating class for bottom navigation bar
class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context,int newindex, _) {

//container that contains items of bottom navigation bar
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2.0)
        ),
        child: BottomNavigationBar(
        currentIndex: newindex,

        //making indexchangenotifier value to index
        onTap: (index){
          indexChangeNotifier.value=index;
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        //fixing background color,selected and unseleccted color, and selected and unselected icon theme.
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        selectedItemColor: const Color.fromARGB(255, 14, 14, 14),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 8, 8, 8)),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),

        //creating bottom navigation bar items with icons and other properties.
        items: const[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Explore'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.elderly,
            ),
            label: 'Requests'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ),
            label: 'Donations'
          ),
          
        ],
          ),
      );
    }
    ); 
  }
}