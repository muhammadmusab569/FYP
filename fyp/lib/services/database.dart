import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods{
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).set(userInfoMap);
  }

  UpdateUserWallet(String id, String amount)async{
    return await FirebaseFirestore.instance.collection("user").doc(id).update({"Wallet" : amount});
  }


  Future addFoodItem(Map<String, dynamic> userInfoMap, String name)async{
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }



  Future<Stream<QuerySnapshot>> getFoodItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).collection("cart").add(userInfoMap);
  }


  Future<Stream<QuerySnapshot>> getFoodCart(String id)async{
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }


  UpdateUserwallet(String id, String amount)async{
    return await FirebaseFirestore.instance.collection("user").doc(id).update(
        {"Wallet" : amount});
  }
  Future<void> deleteFoodItem(String foodName) async {
    try {
      await FirebaseFirestore.instance
          .collection("food")
          .where('Name', isEqualTo: foodName)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.first.reference.delete();
        }
      });
    } catch (error) {
      throw error;
    }
  }

}