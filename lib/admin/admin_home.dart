import 'package:flutter/material.dart';
import 'package:mad_app/admin/add_food.dart';
import 'package:mad_app/widget/widget_support.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 70, right: 20),
        child: Column(
          children: [
            Center(
                child: Text(
              "Admin Home",
              style: AppWidget.HeadLIneTextFieldStyle(),
            )),
            SizedBox(
              height: 50,
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFood()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Image.asset(
                            "images/food.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Add food items",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
