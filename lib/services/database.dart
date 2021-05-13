import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String nombre, String apellidos, String cip, String dni, String fechaNacimiento) async{
    return await usersCollection.doc(uid).set({
      'nombre': nombre,
      'apellidos': apellidos,
      'cip': cip,
      'dni': dni,
      'fecha de nacimiento': fechaNacimiento
    });
  }
}