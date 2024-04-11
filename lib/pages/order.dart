import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_app/widget/widget_support.dart';
import '../services/database.dart';
import '../services/shared_pref.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;
  int total = 0, amount2 = 0;

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      amount2 = total;
      setState(() {});
    });
  }

  Future<void> checkout() async {
    // Get the current wallet amount
    int currentWalletAmount = int.parse(wallet!);

    // Calculate the new wallet amount after deducting the total price
    int newWalletAmount = currentWalletAmount - total;

    if (newWalletAmount < 0) {
      // Show a snackbar message if there is not enough money in the wallet
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Not enough money in your wallet'),
      ));
    } else {
      // Update the wallet amount in the database
      await DatabaseMethods().UpdateUserWallet(id!, newWalletAmount.toString());
      // Save the updated wallet amount locally
      await SharedPreferenceHelper().saveUserWallet(newWalletAmount.toString());

      // Clear the cart and update the UI
      await DatabaseMethods().clearCart(id!);
      total = 0;
      foodStream = null;
      setState(() {});
      foodStream = DatabaseMethods().getFoodCart(id!) as Stream?;
    }
  }

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodStream = await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  @override
  void initState() {
    super.initState();
    ontheload();
    startTimer();
    setState(() {});
  }

  Stream? foodStream;

  Widget foodCart() {
    return StreamBuilder(
      stream: foodStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // Decrease the quantity of the item
                                    int quantity = int.parse(ds["Quantity"]);
                                    if (quantity > 1) {
                                      quantity--;
                                      await DatabaseMethods().updateCartItem(
                                        id!,
                                        ds.id,
                                        {"Quantity": quantity.toString()},
                                      );
                                      setState(() {});
                                    }
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 10),
                                Text(ds["Quantity"]),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () async {
                                    // Increase the quantity of the item
                                    int quantity = int.parse(ds["Quantity"]);
                                    quantity++;
                                    await DatabaseMethods().updateCartItem(
                                      id!,
                                      ds.id,
                                      {"Quantity": quantity.toString()},
                                    );
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                ),
                                SizedBox(width: 20),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ds["Name"],
                                      style: AppWidget.SemiboldTextFieldStyle(),
                                    ),
                                    Text(
                                      "\$" + ds["Total"],
                                      style: AppWidget.SemiboldTextFieldStyle(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                // Remove the item from the cart
                                await DatabaseMethods()
                                    .removeCartItem(id!, ds.id);
                                setState(() {});
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Food Cart",
                      style: AppWidget.HeadLIneTextFieldStyle(),
                    )))),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: foodCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    "\$" + total.toString(),
                    style: AppWidget.SemiboldTextFieldStyle(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                int amount = int.parse(wallet!) - amount2;
                if (amount >= 0) {
                  await DatabaseMethods()
                      .UpdateUserWallet(id!, amount.toString());
                  await SharedPreferenceHelper()
                      .saveUserWallet(amount.toString());
                  checkout();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Not enough money in your wallet'),
                  ));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text(
                  "CheckOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
