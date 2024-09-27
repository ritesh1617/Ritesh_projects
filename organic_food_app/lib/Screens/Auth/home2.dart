// import 'package:f2c/Const/List.dart';
// import 'package:f2c/Provider/ProductSearchDelegate.dart';
// import 'package:f2c/Theme/strings.dart';
// import 'package:f2c/Theme/style.dart';
// import 'package:f2c/widgets/Gridview.dart';
// import 'package:f2c/widgets/login/bgScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:f2c/Controller/Auth_controller.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Home2 extends StatefulWidget {
//   const Home2({super.key});

//   @override
//   State<Home2> createState() => _Home2State();
// }

// class _Home2State extends State<Home2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           Appname,
//           style: regularBlack10,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               print('Logout button pressed');
//             },
//             icon: Icon(Icons.logout),
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               print('Search button pressed');
//               showSearch(
//                 context: context,
//                 delegate: ProductSearchDelegate(
//                   ProductName, // Product names
//                   images2, // Product images
//                   ProductPrice, // Product prices
//                   Productgrams, // Product grams
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: BackScreen(
//           child: Column(
//         children: [
//           SizedBox(height: 10), // Add some space
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(24)),
//             child: VxSwiper.builder(
//               autoPlay: true,
//               autoPlayAnimationDuration: Duration(seconds: 3),
//               aspectRatio: 2.5,
//               realPage: images1.length,
//               itemCount: images1.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: 300,
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(24)),
//                     image: DecorationImage(
//                       image: AssetImage(images1[index]),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           SizedBox(
//             child: GridViewBuilderWidget(),
//           )
//         ],
//       )),
//     );
//   }
// }
