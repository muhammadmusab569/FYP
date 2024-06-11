import 'package:flutter/material.dart';
import 'package:fyp/services/database.dart';
import 'package:fyp/admin/add_food.dart';
import 'package:fyp/widgets/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  List<String> _foodItems = [];

  @override
  void initState() {
    super.initState();
    fetchFoodItems();
  }

  void fetchFoodItems() async {
    try {
      var snapshot = await _databaseMethods.getFoodItem("food");
      snapshot.listen((querySnapshot) {
        setState(() {
          _foodItems = querySnapshot.docs.map((doc) => doc['Name'] as String).toList();
        });
      });
    } catch (error) {
      print("Failed to fetch food items: $error");
    }
  }

  Future<void> deleteFoodItem(String foodName) async {
    try {
      await _databaseMethods.deleteFoodItem(foodName);
      setState(() {
        _foodItems.remove(foodName);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Food item '$foodName' deleted successfully"),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to delete food item"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Home Admin",
                style: AppWidget.headlineTextFeildStyle(),
              ),
            ),
            SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddFood()),
                );
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Image.asset(
                          "assets/images/food.jpg",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        "Add Food Items",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_foodItems[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteFoodItem(_foodItems[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
