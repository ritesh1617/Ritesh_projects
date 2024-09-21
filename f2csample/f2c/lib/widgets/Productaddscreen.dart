import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:f2c/Models/Productmodel.dart' as model; // Prefixed import
import 'package:f2c/Provider/Productprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _productName = '';
  String _productPrice = '';
  String _productGrams = '';
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_image != null) {
        try {
          // Upload image to Firebase Storage
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('product_images')
              .child('${DateTime.now().toIso8601String()}.jpg');
          await storageRef.putFile(_image!);
          final imageUrl = await storageRef.getDownloadURL();

          // Save product data to Firestore
          final newProduct = {
            'name': _productName,
            'price': _productPrice,
            'grams': _productGrams,
            'imageUrl': imageUrl,
          };
          await FirebaseFirestore.instance
              .collection('products')
              .add(newProduct);

          // Go back to the previous screen
          Navigator.of(context).pop();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add product: $e')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please pick an image')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: _image == null
                      ? Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey[200],
                          child:
                              Icon(Icons.add_a_photo, color: Colors.grey[800]),
                        )
                      : Image.file(_image!,
                          width: 100, height: 100, fit: BoxFit.cover),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productName = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productPrice = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Grams'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product grams';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productGrams = value!;
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
