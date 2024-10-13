import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isDarkMode = false;
  List<Product> products = [
    Product(
        name: "Product 1",
        imageUrl: "https://via.placeholder.com/150",
        price: 19.99),
    Product(
        name: "Product 2",
        imageUrl: "https://via.placeholder.com/150",
        price: 29.99),
    Product(
        name: "Product 3",
        imageUrl: "https://via.placeholder.com/150",
        price: 39.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
                Get.changeThemeMode(
                    isDarkMode ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Get.snackbar(
                "Product Selected",
                product.name,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(product.imageUrl, height: 100, width: 100),
                  SizedBox(height: 10),
                  Text(product.name),
                  SizedBox(height: 10),
                  Text("\$${product.price.toStringAsFixed(2)}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
