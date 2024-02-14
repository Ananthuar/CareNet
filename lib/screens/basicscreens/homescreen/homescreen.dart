
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/menubar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// Stores the currently selected page index
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      drawer: const HomeMenuBar(),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(20, 0),
                    child:IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      onPressed: (){
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(45, 0),
                    child:  const Text(
                      'Hey, Care Net..!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 11, 11, 11),
                        fontSize: 20,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ],
              ),
               Row(
                children: [
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(50, 30),
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/Home_3.jpg',
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(40, 40),
                        child:  const Text(
                          'Ready to connect \n needed ones to ✨ \n right hand..!',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 8

                          ),
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(40, 60),
                        child:  const Text(
                          ' ✨ ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13

                          ),
                        )
                      ),
                      Transform.translate(
                        offset: const Offset(40, 70),
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/Home_1.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(20, 90),
                        child:  const Text(
                          ' ✨ ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13

                          ),
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(50, 80),
                        child:  const Text(
                          'Waiting for \n hundreds of    ✨ \n helping hands..!',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 8

                          ),
                        )
                      ),
                      Transform.translate(
                        offset: const Offset(20, 90),
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/Home_2.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(20, 120),
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 236, 235, 235),
                      ),
                      
                      width: 100,
                      height: 100,
                      child:  Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 7),
                            child: const Icon(Icons.volunteer_activism),
                          ),
                          Transform.translate(offset: 
                            const Offset(3, 20),
                            child: const Text('Help anytime, \n anywhere'),
                          )
                        ],
                      )
                      
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(30,120),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 236, 235, 235),
                        ),
                        
                        width: 100,
                        height: 100,
                        child:  Column(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 7),
                              child: const Icon(Icons.check_circle_outline),
                            ),
                            Transform.translate(offset: 
                              const Offset(3, 20),
                              child: const Text('Give with \n trust'),
                            )
                          ],
                        )
                        
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(40,120),
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 236, 235, 235),
                      ),
                      
                      width: 100,
                      height: 100,
                      child:  Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 7),
                            child: const Icon(Icons.diversity_2),
                          ),
                          Transform.translate(offset: 
                            const Offset(3, 20),
                            child: const Text('Work \n Volunteerely'),
                          )
                        ],
                      )
                      
                    ),
                  )
                ],
              ),
               Row(
                children: [
                  Transform.translate(
                    offset: const Offset(70, 170),
                    child: ElevatedButton(
                      autofocus: true,
                      onPressed:() {},
                      child: const Text("Let's Lend a helping hand..!" )),
                  )
                ],
              ),
              Column(
                children: [
                  Transform.translate(
                    offset: const Offset(3, 230),
                    child: const Text(
                      'Give a hand to them...!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(3, 260),
                    child: const Text(
                      'Donate a little as you can to those who need help...!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  
}