import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:link_chaldal/cart/cart_model.dart';
import 'package:link_chaldal/cart/cart_provider.dart';
import 'package:link_chaldal/cart/cart_screen.dart';
import 'package:link_chaldal/cart/db_helper.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  String? name;
  String? image;
  int? price;
  String? quantity;
  int? index;
  String? description;

  ProductDetail(
      {this.image,
      this.name,
      this.price,
      this.quantity,
      this.index,
      this.description});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Center(
                child: Badge(
                  showBadge: true,
                  badgeContent: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Text(value.getCounter().toString(),
                          style: TextStyle(color: Colors.white));
                    },
                  ),
                  animationType: BadgeAnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
            SizedBox(width: 20.0)
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'Product Details',
            style: TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                    options: CarouselOptions(
                      // autoPlay: true,
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: 200,
                      aspectRatio: 5,
                      viewportFraction: 1.0,
                    ),
                    items: [
                      Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      )
                    ]),
              ),
              Row(
                children: [
                  Text(
                    '৳${widget.price.toString()}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '| ${widget.quantity!}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      dbHelper!
                          .insert(Cart(
                              id: widget.index,
                              productId: widget.index.toString(),
                              productName: widget.name.toString(),
                              initialPrice: widget.price,
                              productPrice: widget.price,
                              quantity: 1,
                              unitTag: '',
                              image: widget.image.toString()))
                          .then((value) {
                        cart.addTotalPrice(
                            double.parse(widget.price.toString()));
                        cart.addCounter();

                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Product is added to cart'),
                          duration: Duration(seconds: 1),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }).onError((error, stackTrace) {
                        print("error" + error.toString());
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Product is already added in cart'),
                            duration: Duration(seconds: 1));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                thickness: 2,
              ),
              Text(
                widget.description!,
                style: TextStyle(fontSize: 18),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         dbHelper!
              //             .insert(Cart(
              //                 id: widget.index,
              //                 productId: widget.index.toString(),
              //                 productName: widget.name.toString(),
              //                 initialPrice: widget.price,
              //                 productPrice: widget.price,
              //                 quantity: 1,
              //                 unitTag: '',
              //                 image: widget.image.toString()))
              //             .then((value) {
              //           cart.addTotalPrice(
              //               double.parse(widget.price.toString()));
              //           cart.addCounter();

              //           final snackBar = SnackBar(
              //             backgroundColor: Colors.green,
              //             content: Text('Product is added to cart'),
              //             duration: Duration(seconds: 1),
              //           );

              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         }).onError((error, stackTrace) {
              //           print("error" + error.toString());
              //           final snackBar = SnackBar(
              //               backgroundColor: Colors.red,
              //               content: Text('Product is already added in cart'),
              //               duration: Duration(seconds: 1));

              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         });
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 150,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           color: Colors.purple,
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Text(
              //           'Add to Cart',
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),

              //     //   IconButton(
              //     //     icon: Icon(
              //     //       Icons.add_box_outlined,
              //     //       size: 40,
              //     //       color: Colors.purple,
              //     //     ),
              //     //     onPressed: () {
              //     //       dbHelper!
              //     //           .insert(Cart(
              //     //               id: widget.index,
              //     //               productId: widget.index.toString(),
              //     //               productName: widget.name.toString(),
              //     //               initialPrice: widget.price,
              //     //               productPrice: widget.price,
              //     //               quantity: 1,
              //     //               unitTag: '',
              //     //               image: widget.image.toString()))
              //     //           .then((value) {
              //     //         cart.addTotalPrice(
              //     //             double.parse(widget.price.toString()));
              //     //         cart.addCounter();

              //     //         final snackBar = SnackBar(
              //     //           backgroundColor: Colors.green,
              //     //           content: Text('Product is added to cart'),
              //     //           duration: Duration(seconds: 1),
              //     //         );

              //     //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //     //       }).onError((error, stackTrace) {
              //     //         print("error" + error.toString());
              //     //         final snackBar = SnackBar(
              //     //             backgroundColor: Colors.red,
              //     //             content: Text('Product is already added in cart'),
              //     //             duration: Duration(seconds: 1));

              //     //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //     //       });
              //     //     },
              //     //   )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
