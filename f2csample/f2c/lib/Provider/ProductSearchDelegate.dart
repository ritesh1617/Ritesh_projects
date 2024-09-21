import 'package:f2c/Provider/Productprovider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f2c/Screens/ProductDetailPage.dart';

class ProductSearchDelegate extends SearchDelegate<Product> {
  final List<String> productNames;
  final List<String> productImages;
  final List<String> productPrices;
  final List<String> productGrams;

  ProductSearchDelegate(this.productNames, this.productImages,
      this.productPrices, this.productGrams);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> results = [];
    for (int i = 0; i < productNames.length; i++) {
      if (productNames[i].toLowerCase().contains(query.toLowerCase())) {
        results.add(Product(
          name: productNames[i],
          price: productPrices[i],
          grams: productGrams[i],
          imagePath: productImages[i],
        ));
      }
    }

    results.sort((a, b) => a.name.compareTo(b.name));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return ListTile(
          leading: Image.asset(product.imagePath),
          title: Text(product.name),
          subtitle: Text('${product.price} - ${product.grams}'),
          onTap: () {
            Get.to(ProductDetailPage(product: product));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestions = [];
    for (int i = 0; i < productNames.length; i++) {
      if (productNames[i].toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(Product(
          name: productNames[i],
          price: productPrices[i],
          grams: productGrams[i],
          imagePath: productImages[i],
        ));
      }
    }

    suggestions.sort((a, b) => a.name.compareTo(b.name));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          leading: Image.asset(product.imagePath),
          title: Text(product.name),
          subtitle: Text('${product.price} - ${product.grams}'),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}
