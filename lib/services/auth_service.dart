// we are going to do this later


// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Correcting function names:
//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }

//   Future<User?> signUpWithEmail(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }
