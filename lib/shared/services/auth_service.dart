import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  String? message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseException catch (e){
      if(e.code == 'weak-password') {
        throw AuthException("senha muito fraca");
      } else if(e.code == 'email-already-in-use') {
        throw AuthException("email ja cadastrado");
      }
    } catch(e) {
      print(e);
    }
  }

  login(String email, String senha) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseException catch (e){
      if(e.code == 'user-not-found') {
        throw AuthException("E-mail Não Encontrado");
      } else if(e.code == 'wrong-password') {
        throw AuthException("Senha Incorreta");
      } else if(e.code == 'invalid-email'){
        throw AuthException("E-mail Inválido");
      } else if(e.code == 'too-many-requests'){
        throw AuthException("Máximo de tentativas expiradas. Tente novamente mais tarde");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}