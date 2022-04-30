import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task/app/auth/model/user_model.dart';
import 'package:task/app/home/model/log_model.dart';

import '../app/play/model/question_model.dart';

class ApiService {
  UserCredential? userCredential;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference questions =
      FirebaseFirestore.instance.collection('questions');

  List<QuestionModel> questionsList = [];
  List<LogModel> logList = [];

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'true';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    return 'false ';
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  tryLoginWithGoogle() async {
    UserCredential userCredential = await signInWithGoogle();

    if (userCredential.user == null) {}
    addUser(
        userName: userCredential.user!.displayName,
        mobile: userCredential.user!.phoneNumber,
        email: userCredential.user!.email,
        id: userCredential.user!.uid);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    await addUser(
      mobile: userCredential.user!.phoneNumber,
      userName: userCredential.user!.displayName,
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
    );

    return userCredential;
  }

  Future<String> registerUser({
    required String email,
    required String password,
    required String mobile,
    required String userName,
  }) async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUser(
        mobile: mobile,
        userName: userName,
        id: userCredential?.user!.uid,
        email: email,
      );

      return 'user add successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'this password is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'this email is already exist';
      }
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  addUser({
    required String? userName,
    required String? mobile,
    required String? email,
    required String? id,
  }) {
    UserModel user = UserModel(
      email: email,
      id: id,
      mobile: mobile,
      userName: userName,
    );

    return users
        .doc(id)
        .set(
          user.userModelToJson(),
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void createNewLog(LogModel logModel) {
    FirebaseFirestore.instance
        .collection('history')
        .doc(logModel.id)
        .set(logModel.toJson())
        .then((value) {
      print('loged add success');
    });
  }


}
