import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Transform.translate(
            offset: const Offset(10, 10),
            child: Container(
              width: 340,
              height: 680,
              decoration: BoxDecoration(
                color: const Color.fromARGB(235, 232, 232, 232),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(45, 15),
                        child: const Text(
                          'Here, the hands will lend for you..💕',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
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
                            offset: const Offset(
                              10, 40
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  width: 335,
                                  
                                  child: Text("   Searching for a helping hand..? \n  Much helping  hands are ready to lend for you\n  at  anytime  anywhere..! \n  Make requests here if you need a help... \n\n\n  Can you see people who looking for a helping \n  hand..? \n  Can't help them alone...? \n  Don't worry... Care Net is here for you... \n  Rise requests for them..!"),
                                ),
                                const SizedBox(
                                  width: 330,
                                  child: Center(
                                    child: Text(
                                      '\n\n\nRise a request..\n\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(-10, 0),
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        child: const Text('Self Request')
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: (){},
                                      child: const Text('Request for others')
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(80, 90),
                            child: const SizedBox(
                              width: 330,
                              child: Text("  Can't help financially..?\n  Work volunteerly with us... \n  Join today...✨"),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(1,150),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (
                                      (context) => const VolunteershipScreen()
                                    )
                                  )
                                );
                              },
                              child: const Text('Hey')
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ) 
      )
    );
  }
}