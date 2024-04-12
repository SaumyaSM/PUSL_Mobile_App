import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_app/services/database.dart'; // Import your database service
import '../services/shared_pref.dart'; // Import your shared preferences service

class EditItemPage extends StatefulWidget {
  final String name;
  final String detail;
  final String price;
  final String image;

  EditItemPage({
    required this.name,
    required this.detail,
    required this.price,
    required this.image,
  });

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  String? id;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getthesharedpref();
    _nameController.text = widget.name;
    _detailController.text = widget.detail;
    _priceController.text = widget.price;
  }

  void getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _detailController,
              decoration: InputDecoration(labelText: 'Detail'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16.0),
            Image.network(widget.image),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Update item in the database
                String name = _nameController.text;
                String detail = _detailController.text;
                String price = _priceController.text;

                DatabaseMethods().updateFoodItem(id!, "Name", name);
                DatabaseMethods().updateFoodItem(id!, "Detail", detail);
                DatabaseMethods().updateFoodItem(id!, "Price", price);

                // Navigate back to the previous page
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
