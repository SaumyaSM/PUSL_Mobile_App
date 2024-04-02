import 'package:flutter/material.dart';
import 'package:mad_app/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.HeadLIneTextFieldStyle(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.LightTextFieldStyle(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "LKR 2000",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add Money",
                style: AppWidget.boldTextFieldStyle(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "LKR 100",
                    style: AppWidget.SemiboldTextFieldStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "LKR 500",
                    style: AppWidget.SemiboldTextFieldStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "LKR 1000",
                    style: AppWidget.SemiboldTextFieldStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "LKR 2000",
                    style: AppWidget.SemiboldTextFieldStyle(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
