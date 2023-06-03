import 'package:flutter/material.dart';
import 'package:flutter_application_project/models/category_model.dart';
import 'package:flutter_application_project/models/models.dart';

import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final Iterable<Product> categoryProducts =
        Product.products.where((product) => product.category == category.name);
    return Scaffold(
            appBar: CustomAppBar(title: category.name),
            bottomNavigationBar: CustomNavBar(),
            body: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: categoryProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: Product.products[0],
                      widthFactor: 2.2,
                    ),
                  );
                }))
        // ProductCard(
        //   product: Product.products[0]
        // ),
        ;
  }
}
