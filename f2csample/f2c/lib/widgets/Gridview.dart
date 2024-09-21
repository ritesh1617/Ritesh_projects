import 'package:f2c/Const/List.dart';
import 'package:f2c/Provider/Productprovider.dart';
import 'package:f2c/Screens/AddToCart.dart';
import 'package:f2c/Screens/Wishlist.dart';
import 'package:f2c/Theme/color.dart';
import 'package:f2c/Theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GridViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No products available'));
        }

        final products = snapshot.data!.docs;

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final productName = product['name'] ?? 'No Name';
            final productPrice = product['price'] ?? '0';
            final productGrams = product['grams'] ?? '0g';
            final productImageUrl = product['imageUrl'] ?? '';

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                            image: DecorationImage(
                              image: productImageUrl.isNotEmpty
                                  ? NetworkImage(productImageUrl)
                                  : AssetImage('assets/images/placeholder.png')
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              final productData = Product(
                                name: productName,
                                price: productPrice,
                                grams: productGrams,
                                imagePath: productImageUrl,
                              );
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .addToWishlist(productData);
                              Get.to(WishlistScreen());
                            },
                            icon: Icon(Icons.favorite_border),
                            color: wishlisticoncolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$${productPrice.toString()}',
                          style: TextStyle(
                            color: productPriceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          productGrams,
                          style: TextStyle(
                            color: ProductGramsColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final productData = Product(
                        name: productName,
                        price: productPrice,
                        grams: productGrams,
                        imagePath: productImageUrl,
                      );
                      Provider.of<ProductProvider>(context, listen: false)
                          .addToCart(productData);
                      Get.to(CartScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: productPriceColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15)),
                      ),
                    ),
                    child: Text(
                      'ADD',
                      style: Addtocartstyle,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
