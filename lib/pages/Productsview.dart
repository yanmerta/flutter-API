import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wisata/model/product.dart';
import 'package:wisata/services/database_helper.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late Future<List<Product>> _productListFuture;
  Key myKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _productListFuture = getProductList();
  }

  Future<List<Product>> getProductList() async {
    final List<Map<String, dynamic>> productMapList =
        await DatabaseHelper.instance.getProductMapList();
    final List<Product> productList = [];
    productMapList.forEach((productMap) {
      productList.add(Product.fromMap(productMap));
    });
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top + 10;
    double paddingBottom = MediaQuery.of(context).padding.bottom + 50;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: paddingTop),
          child: Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Column(
              children: [
                Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: Text(
                    'Find your best\nfurniture',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search ...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: height * 0.5 + 150,
                  child: FutureBuilder<List<Product>>(
                      key: UniqueKey(),
                      future: getProductList(),
                      builder: (context, snapshot) {
                        while (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.data!.isEmpty) {
                          return Center(child: Text('Tidak ada data'));
                        } else {
                          return GridView.builder(
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:
                                    0, // ubah nilai crossAxisSpacing menjadi lebih besar
                                mainAxisSpacing: 0,
                                childAspectRatio: (3 / 5),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                Product product = snapshot.data![index];

                                File imageFile = File(product.image);

                                return Container(
                                    width: 196,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Card(
                                      elevation: 7,
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.file(
                                                  imageFile,
                                                  fit: BoxFit.cover,
                                                  height: 160,
                                                  width: width,
                                                )),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              product.title,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Category",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  "Rp. ${product.price}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'asset/images/6.jpg',
                                                  height: 12,
                                                  width: 12,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "4/5",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              });
                        }
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
