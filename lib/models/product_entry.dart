// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> ProductEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String ProductEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    String thumbnail;
    int price;
    bool isFeatured;
    int ratingProduct;
    String sizeProduct;
    String brand;
    int views;
    int userId;
    String uploaderUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.price,
        required this.isFeatured,
        required this.ratingProduct,
        required this.sizeProduct,
        required this.brand,
        required this.views,
        required this.userId,
        required this.uploaderUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        isFeatured: json["is_featured"],
        ratingProduct: json["rating_product"],
        sizeProduct: json["size_product"],
        brand: json["brand"],
        views: json["views"],
        userId: json["user_id"],
        uploaderUsername: json["uploader_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "price": price,
        "is_featured": isFeatured,
        "rating_product": ratingProduct,
        "size_product": sizeProduct,
        "brand": brand,
        "views": views,
        "user_id": userId,
        "uploader_username": uploaderUsername,
    };
}
