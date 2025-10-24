
import 'package:evently_app/models/login_request.dart';
import 'package:evently_app/models/register_request.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseServices {
  static Future<UserCredential> register(RegisterRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  static Future<UserCredential> login(LoginRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  
}
