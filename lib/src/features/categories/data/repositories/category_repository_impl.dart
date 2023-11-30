import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_notes/src/features/categories/data/models/category_model.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<CategoryModel?> createCategory(CategoryEntity category) async {
    try {
      var db = FirebaseFirestore.instance;
      var collection = db.collection('categories').doc();
      DateTime timestamp = DateTime.now();
      CategoryModel newCategory = CategoryModel(
        id: collection.id,
        userId: category.userId,
        name: category.name,
        createdAt: timestamp,
        updatedAt: timestamp,
      );
      await collection.set(newCategory.toJson()).then(
            (doc) => print("Document created with id: ${collection.id}"),
            onError: (e) => print("Error creating document $e"),
          );
      return Future.value(newCategory);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      var db = FirebaseFirestore.instance;
      await db.collection('categories').doc(id).delete().then(
            (doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"),
          );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<CategoryModel?>> getCategories() async {
    try {
      var db = FirebaseFirestore.instance;
      var currentUserId = FirebaseAuth.instance.currentUser?.uid;
      List<CategoryModel?> categories = [];
      await db
          .collection('categories')
          .where('user_id', isEqualTo: currentUserId)
          .get()
          .then(
              (event) => {
                    event.docs.forEach((element) {
                      categories.add(CategoryModel.fromJson(element.data()));
                    })
                  },
              onError: (e) => {print("Error getting documents $e")});
      categories.sort((a, b) => a!.updatedAt!.compareTo(b!.updatedAt!));
      return Future.value(categories);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    try {
      var db = FirebaseFirestore.instance;
      var data = await db.collection('categories').doc(id).get();
      CategoryModel category = CategoryModel.fromJson(data.data()!);
      return Future.value(category);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<CategoryModel?> updateCategory(CategoryEntity category) async {
    try {
      if (category.id == null) {
        print("Category id is null");
        return Future.value(null);
      }

      var db = FirebaseFirestore.instance;
      var collection = db.collection('categories').doc(category.id);
      DateTime timestamp = DateTime.now();
      CategoryModel newCategory = CategoryModel(
        id: category.id,
        userId: category.userId,
        name: category.name,
        createdAt: category.createdAt,
        updatedAt: timestamp,
      );
      await collection.update(newCategory.toJson()).then(
            (doc) => print("Document updated with id: ${collection.id}"),
            onError: (e) => print("Error updating document $e"),
          );
      return Future.value(newCategory);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<bool> isCategoryEmpty(String id) async {
    try {
      var db = FirebaseFirestore.instance;
      var data = await db
          .collection('notes')
          .where('category_id', isEqualTo: id)
          .get();
      return Future.value(data.docs.isEmpty);
    } catch (e) {
      print(e);
      return Future.value(true);
    }
  }

  @override
  Future<int> getCategoriesLength() async {
    try {
      var db = FirebaseFirestore.instance;
      var currentUserId = FirebaseAuth.instance.currentUser?.uid;
      var data = await db
          .collection('categories')
          .where('user_id', isEqualTo: currentUserId)
          .get();
      return Future.value(data.docs.length);
    } catch (e) {
      print(e);
      return Future.value(0);
    }
  }
}
