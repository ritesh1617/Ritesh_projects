import 'package:flutter/material.dart';
import 'package:organic_food_app/Models/Productmodel.dart'as model;
import 'package:organic_food_app/Provider/Productprovider.dart';
import 'package:organic_food_app/Screens/ChekoutScreen.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(product.imagePath),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.price,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              product.grams,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .addToCart(product);
                      // Add any additional action for "Add to Cart"
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .addToCart(product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ),
                      );
                    },
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
