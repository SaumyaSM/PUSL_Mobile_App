import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_app/pages/details.dart';
import 'package:mad_app/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pizza = false, burger = false, grill = false, icecream = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, Saumya",
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Delicious Food",
              style: AppWidget.HeadLIneTextFieldStyle(),
            ),
            Text(
              "Discover and Get Great Food",
              style: AppWidget.LightTextFieldStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/pasta2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Cheesy Pasta Plate",
                                style: AppWidget.SemiboldTextFieldStyle(),
                              ),
                              Text(
                                "Fiery pasta delight!",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "LKR 1250",
                                style: AppWidget.SemiboldTextFieldStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/pasta.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Spicy Pasta Plate",
                              style: AppWidget.SemiboldTextFieldStyle(),
                            ),
                            Text(
                              "Fiery pasta delight!",
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "LKR 1250",
                              style: AppWidget.SemiboldTextFieldStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/pasta.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Spicy Pasta Plate",
                              style: AppWidget.SemiboldTextFieldStyle(),
                            ),
                            Text(
                              "Fiery pasta delight!",
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "LKR 1250",
                              style: AppWidget.SemiboldTextFieldStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/pasta.png',
                              height: 125,
                              width: 125,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Italian recipe spicy pasta",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "With mozzarella cheese",
                                    style: AppWidget.LightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "LKR 1500",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/pasta.png',
                              height: 125,
                              width: 125,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Italian recipe spicy pasta",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "With mozzarella cheese",
                                    style: AppWidget.LightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "LKR 1500",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/pasta.png',
                              height: 125,
                              width: 125,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Italian recipe spicy pasta",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "With mozzarella cheese",
                                    style: AppWidget.LightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "LKR 1500",
                                    style: AppWidget.SemiboldTextFieldStyle(),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            pizza = true;
            burger = false;
            grill = false;
            icecream = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'images/pizza.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            pizza = false;
            burger = true;
            grill = false;
            icecream = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'images/bur.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            pizza = false;
            burger = false;
            grill = true;
            icecream = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: grill ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'images/grill.png',
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            pizza = false;
            burger = false;
            grill = false;
            icecream = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'images/ice.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
