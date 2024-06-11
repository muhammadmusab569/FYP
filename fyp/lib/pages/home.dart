import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/pages/details.dart';
import 'package:fyp/services/database.dart';
import 'package:fyp/widgets/widget_support.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = true, salad = false, burger = false;

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return Center(child: Text("No items found"));
        }

        return GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      detail: ds["Detail"],
                      image: ds["Image"],
                      name: ds["Name"],
                      price: ds["Price"],
                    ),
                  ),
                );
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                          ds["Image"],
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes!)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.error,
                                size: 50,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ds["Name"],
                            style: AppWidget.semiBoldTextFeildStyle(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Fresh and Healthy",
                            style: AppWidget.lightTextFeildStyle(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            ds["Price"] != null ? "\$${ds["Price"]}" : "N/A",
                            style: AppWidget.semiBoldTextFeildStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Musab", style: AppWidget.boldTextFeildStyle()),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text("Delicious Food", style: AppWidget.headlineTextFeildStyle()),
              SizedBox(height: 30.0),
              Text("Discover and Get Great Food", style: AppWidget.lightTextFeildStyle()),
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: showItem(),
              ),
              SizedBox(height: 30.0),
              allItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            setState(() {
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
            });
            fooditemStream = await DatabaseMethods().getFoodItem("Ice-cream");
          },
          child: getImageWidget('assets/images/ice-cream.png', icecream),
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
            });
            fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
          },
          child: getImageWidget('assets/images/pizza.png', pizza),
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              icecream = false;
              pizza = false;
              salad = true;
              burger = false;
            });
            fooditemStream = await DatabaseMethods().getFoodItem("Salad");
          },
          child: getImageWidget('assets/images/salad.png', salad),
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              icecream = false;
              pizza = false;
              salad = false;
              burger = true;
            });
            fooditemStream = await DatabaseMethods().getFoodItem("Burger");
          },
          child: getImageWidget('assets/images/burger.png', burger),
        ),
      ],
    );
  }

  Widget getImageWidget(String imagePath, bool isSelected) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          imagePath,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
