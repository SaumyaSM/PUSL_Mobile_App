import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  Future SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteuser() async {
    await FirebaseAuth.instance.signOut();
    User? user = await FirebaseAuth.instance.currentUser;
    await user?.delete();
  }
}
