
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e);
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  })  async{
  try{
  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }catch(e){
    print(e);
  }
  }
  
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}
