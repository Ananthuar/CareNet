import 'package:flutter/material.dart';

class VolunteershipScreen extends StatelessWidget {
  const VolunteershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(45, 15),
                    child: const Text(
                      'Are you ready to help physically...?',
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
                              
                              child: Text("   Have a thirst to help the neede ones..? \n  Not having the ability to support them \n  financially...? \n  Register yourself with needed details over here... \n\n\n  Do you know someone who ready for voluntierly \n  works for the needed ones at needed time? \n  Can't help them alone...? \n  Don't worry... Care Net is here for you... \n  Add them as volunteers..!"),
                            ),
                            const SizedBox(
                              width: 330,
                              child: Text(
                                '\n\n\n                           Be a volunteer..\n\n',
                                
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Transform.translate(
                                  offset: const Offset(-10, 0),
                                  child: ElevatedButton(
                                    onPressed: (){},
                                    child: const Text('Register as volunteer')
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ) 
      )
    );
  }
}