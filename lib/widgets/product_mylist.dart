import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:final_whistle_mobile/models/product_entry.dart';
import 'package:final_whistle_mobile/widgets/product_entry_card.dart';

class MyProductListPage extends StatefulWidget {
  const MyProductListPage({super.key});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get("http://localhost:8000/my-products-json/");

    List<ProductEntry> items = [];

    for (var d in response) {
      items.add(ProductEntry.fromJson(d));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
      ),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text("You have no products yet"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data![index],
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
