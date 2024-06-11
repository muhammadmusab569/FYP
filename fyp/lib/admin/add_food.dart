import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/services/database.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _addFoodItem() async {
    if (_formKey.currentState!.validate()) {
      String id = randomAlphaNumeric(10); // Generate a random ID

      Map<String, dynamic> foodItem = {
        "Name": _nameController.text,
        "Price": _priceController.text,
        "Description": _descriptionController.text,
        "Image": _imageController.text,
      };

      await DatabaseMethods().addFoodItem(foodItem, id);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter food name';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Food Name'),
              ),
              TextFormField(
                controller: _priceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter food price';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter food description';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _imageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addFoodItem,
                child: Text('Add Food Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
