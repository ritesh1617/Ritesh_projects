import 'package:flutter/material.dart';
import 'package:organic_food_app/Provider/Productprovider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final totalAmount = productProvider.cart
        .map((product) => double.parse(product.price.substring(1)))
        .reduce((value, element) => value + element);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productProvider.cart.length,
                itemBuilder: (context, index) {
                  final product = productProvider.cart[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(product.imagePath),
                      title: Text(product.name),
                      subtitle: Text('${product.price} - ${product.grams}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total: ₹$totalAmount',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle payment and order processing here
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
