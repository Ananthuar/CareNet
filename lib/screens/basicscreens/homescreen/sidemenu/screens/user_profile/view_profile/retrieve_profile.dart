import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/upload_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> retrieveUserData(ctx) async {
  String? email = await getUserEmail(ctx);
  // Assuming you have a Firestore collection named 'users'
  var userData =
      await FirebaseFirestore.instance.collection('users').doc(email).get();

  if (userData.exists) {
    // Retrieve data from Firestore document
    Map<String, dynamic> userDataMap = userData.data()!;

    // Store the retrieved data in variables
    String fullName = userDataMap['fullname'];
    String dob = userDataMap['dob'];
    String occupation = userDataMap['occupation'];
    String nationality = userDataMap['nationality'];
    String photoUrl = userDataMap['photoUrl'];

    // Create a map to return the retrieved data
    Map<String, dynamic> retrievedData = {
      'fullName': fullName,
      'dob': dob,
      'occupation': occupation,
      'nationality': nationality,
      'photoUrl': photoUrl,
    };

    return retrievedData;
  } else {
    // If the document doesn't exist, return null or handle accordingly
    return {};
  }
}
