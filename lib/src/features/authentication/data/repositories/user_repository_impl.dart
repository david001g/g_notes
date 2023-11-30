import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/features/authentication/data/models/user_model.dart';
import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  @override
  Future<UserModel> createUser() async{
    try {
      var db = FirebaseFirestore.instance;
      var authUser = FirebaseAuth.instance.currentUser;
      String? id = authUser?.uid;
      UserModel newUser = UserModel(
        id: id,
        name: "Your name",
        email: authUser?.email,
        image: starterAvatar,

      );
      await db.collection('users').doc(id).set(newUser.toJson()).then(
            (doc) => print("Document created with id: $id"),
            onError: (e) => print("Error creating document $e"),
          );
      return Future.value(newUser);
    }catch(e){
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<UserEntity> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUser(String id) async{
    try{
      var db = FirebaseFirestore.instance;
      DocumentSnapshot doc = await db.collection('users').doc(id).get();
      UserModel? user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(user);
    }
    catch(e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async{
    try{
      var db = FirebaseFirestore.instance;
      String? id = FirebaseAuth.instance.currentUser?.uid;
      UserModel newUser = UserModel(
        id: id,
        name: user.name,
        email: user.email,
        image: user.image,
      );
      await db.collection('users').doc(id).update(newUser.toJson()).then(
            (doc) => print("Document updated with id: $id"),
            onError: (e) => print("Error updating document $e"),
          );
      return Future.value(newUser);
    }
    catch(e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<int> countNotes() async{
    try{
      var db = FirebaseFirestore.instance;
      String? id = FirebaseAuth.instance.currentUser?.uid;
      var data = await db.collection('notes').where('user_id', isEqualTo: id).get();
      return Future.value(data.size);
    }
    catch(e) {
      print(e);
      return Future.value(0);
    }
  }

  @override
  Future<int> countCategories() async{
    try{
      var db = FirebaseFirestore.instance;
      String? id = FirebaseAuth.instance.currentUser?.uid;
      var data = await db.collection('categories').where('user_id', isEqualTo: id).get();
      return Future.value(data.size);
    }
    catch(e) {
      print(e);
      return Future.value(0);
    }
  }

}