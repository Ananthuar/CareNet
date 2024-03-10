import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckDonations extends StatelessWidget {
  const CheckDonations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<DocumentSnapshot>>(
          future: getDonations(),
          builder: (BuildContext context,
              AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Your Donations',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot doc = snapshot.data![index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Help Seeker: ${doc['seeker_name']}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text('Problem Title: ${doc['problem_title']}'),
                                const SizedBox(height: 10),
                                Text(
                                    'Transferred Amount: ${doc['tranferred_amount']}'),
                                const SizedBox(height: 10),
                                Text(
                                    'Transaction Date: ${doc['date_of_transaction']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Future<List<DocumentSnapshot>> getDonations() async {
  String? email = FirebaseAuth.instance.currentUser?.email;
  if (email != null) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('transactionDetails')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs;
  } else {
    print("Can't find a valid email.");
    return [];
  }
}
