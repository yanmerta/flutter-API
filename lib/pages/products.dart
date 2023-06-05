// ignore_for_file: unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata/model/product.dart';
import 'package:wisata/pages/addproduct.dart';
import 'package:wisata/pages/updateProduct.dart';
import 'package:wisata/services/database_helper.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Product', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
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
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = snapshot.data![index];

                    File imageFile = File(product.image);

                    return Container(
                      width: width,
                      height: 65,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 80,
                          height: 160,
                          child: Image.file(imageFile, fit: BoxFit.cover),
                        ),
                        title: Container(
                            margin: const EdgeInsets.only(top: 6),
                            child: Text(
                              product.title,
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        trailing: Container(
                            width: 100,
                            child: Wrap(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return UpdateProduct(
                                            productId: product.id!);
                                      }));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    )),
                                IconButton(
                                    onPressed: () async {
                                      try {
                                        await DatabaseHelper.instance
                                            .deleteProduct(product.id!);
                                        setState(() {
                                          getProductList();
                                        });
                                      } catch (e) {
                                        print(e.toString());
                                        rethrow;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.pink,
                                    ))
                              ],
                            )),
                        onTap: () {
                          // do something when the item is tapped
                        },
                      ),
                    );
                  },
                );
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.8),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const ProductAdd();
          }));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}








// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   late DatabaseHelper dbHelper;
//   final nameController = TextEditingController();
//   final codeController = TextEditingController();
//   final descriptionController = TextEditingController();
//   bool isEditing = false;

//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DatabaseHelper();
//     dbHelper.initDB().whenComplete(() async {
//       setState(() {});
//     });
//   }

//   // Future<void> addOrEditUser() async {
//   //   String desc = descriptionController.text;
//   //   String name = nameController.text;
//   //   String code = codeController.text;

//   //   if (!isEditing) {
//   //     Product product =
//   //         new Product(name: name, code: code, description: desc, category: '');
//   //     await addProduct(product);
//   //   } else {
//   //     _product.description = desc;
//   //     _product.code = code;
//   //     _product.name = name;
//   //     _product.category = '';
//   //     await updateProduct(_product);
//   //   }
//   //   resetData();
//   //   setState(() {});
//   // }

//   void deleteProduct(int id) async {
//     return await dbHelper.deleteProduct(id);
//   }
//   // void populateFields(Product product) {
//   //   _product = product;
//   //   nameController.text = _product.name;
//   //   codeController.text = _product.code;
//   //   descriptionController.text = _product.description;
//   //   isEditing = true;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text("Product Page"),
//           backgroundColor: Colors.deepPurple.shade600.withOpacity(0.8),
//         ),
//         body: userWidget(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Add your onPressed code here!
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return ProductAdd(
//                   Product(name: "", code: "", category: "", description: ""));
//             })).then((value) => {setState(() {})});
//           },
//           backgroundColor: Colors.green,
//           child: const Icon(Icons.navigation),
//         ));
//   }

//   Widget userWidget() {
//     return FutureBuilder(
//       future: dbHelper.retrieveProducts(),
//       builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, position) {
//                 return Dismissible(
//                     direction: DismissDirection.endToStart,
//                     background: Container(
//                       color: Colors.red,
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Icon(Icons.delete_forever),
//                     ),
//                     key: UniqueKey(),
//                     onDismissed: (DismissDirection direction) async {
//                       await dbHelper
//                           .deleteProduct(snapshot.data![position].id!);
//                     },
//                     child: new GestureDetector(
//                       behavior: HitTestBehavior.opaque,
//                       //onTap: () => populateFields(snapshot.data![position]),
//                       onTap: () => Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return ProductAdd(snapshot.data![position]);
//                       })).then((value) => {setState(() {})}),
//                       child: Column(
//                         children: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         12.0, 12.0, 12.0, 6.0),
//                                     child: Text(
//                                       snapshot.data![position].name,
//                                       style: TextStyle(
//                                           fontSize: 22.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         12.0, 6.0, 12.0, 12.0),
//                                     child: Text(
//                                       snapshot.data![position].code.toString(),
//                                       style: TextStyle(fontSize: 18.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.black26,
//                                           borderRadius:
//                                               BorderRadius.circular(100)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           snapshot.data![position].description
//                                               .toString(),
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             height: 2.0,
//                             color: Colors.grey,
//                           )
//                         ],
//                       ),
//                     ));
//               });
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }