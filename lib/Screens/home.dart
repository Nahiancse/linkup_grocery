import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:link_chaldal/Screens/productDetail.dart';
import 'package:link_chaldal/cart/cart_provider.dart';
import 'package:link_chaldal/model/popular.dart';
import 'package:provider/provider.dart';

import '../cart/cart_model.dart';
import '../cart/cart_screen.dart';
import '../cart/db_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
          title: Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: popularList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          print(index);
                          return ProductDetail(
                            description:popularList[index].description,
                              name: popularList[index].name,
                              image: popularList[index].img,
                              price: popularList[index].price,
                              quantity: popularList[index].quantity,
                              index: index);
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 12,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    popularList[index].img!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  popularList[index].name!,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              // Icon(Icons.storm)
                                              // Text(
                                              //   "${widget.wooProduct.stockStatus.toLowerCase()}",
                                              //   style: TextStyle(
                                              //       color:
                                              //           widget.wooProduct.stockStatus == 'instock'
                                              //               ? Colors.green
                                              //               : Colors.red),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        // padding: EdgeInsets.only(left: 10),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Center(
                                                        child: FittedBox(
                                                            fit: BoxFit.cover,
                                                            child: Text(
                                                              '৳${popularList[index].price!}',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFff666b),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )),
                                                      ),
                                                    ),
                                                    // Expanded(
                                                    //   flex: 1,
                                                    //   child: Center(
                                                    //     child: Text(
                                                    //       "\$${widget.wooProduct.price}",
                                                    //       style: TextStyle(
                                                    //           decoration:
                                                    //               TextDecoration.lineThrough,
                                                    //           fontSize: 12),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Center(
                                                        child: Text(
                                                          '\|${popularList[index].quantity!}',
                                                          // style: TextStyle(
                                                          //     color: Color(0xFFff666b),
                                                          //     fontSize: 16,
                                                          //     fontWeight: FontWeight.w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 4,
                                                  child: Center(
                                                      child: Container(
                                                          child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Center(
                                                        child: FittedBox(
                                                          child: IconButton(
                                                            onPressed: () {
                                                              print(index);
                                                              print(index);
                                                              print(popularList[
                                                                      index]
                                                                  .name
                                                                  .toString());
                                                              print(popularList[
                                                                      index]
                                                                  .price
                                                                  .toString());
                                                              print(popularList[
                                                                      index]
                                                                  .price);
                                                              print('1');

                                                              print(popularList[
                                                                      index]
                                                                  .img
                                                                  .toString());

                                                              dbHelper!
                                                                  .insert(Cart(
                                                                      id: index,
                                                                      productId:
                                                                          index
                                                                              .toString(),
                                                                      productName: popularList[
                                                                              index]
                                                                          .name
                                                                          .toString(),
                                                                      initialPrice:
                                                                          popularList[index]
                                                                              .price,
                                                                      productPrice:
                                                                          popularList[index]
                                                                              .price,
                                                                      quantity:
                                                                          1,
                                                                      unitTag:
                                                                          '',
                                                                      image: popularList[
                                                                              index]
                                                                          .img
                                                                          .toString()))
                                                                  .then(
                                                                      (value) {
                                                                cart.addTotalPrice(double.parse(
                                                                    popularList[
                                                                            index]
                                                                        .price
                                                                        .toString()));
                                                                cart.addCounter();

                                                                final snackBar =
                                                                    SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content: Text(
                                                                      'Product is added to cart'),
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );

                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print("error" +
                                                                    error
                                                                        .toString());
                                                                final snackBar = SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        'Product is already added in cart'),
                                                                    duration: Duration(
                                                                        seconds:
                                                                            1));

                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .add_circle_outline,
                                                              color: Color(
                                                                  0xFFff666b),
                                                              size: 35,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ))))
                                            ],
                                          ),
                                        ),
                                      ))
                                      // Row(
                                      //   children: [
                                      //     Text(
                                      //       '৳${popularList[index].price!}',
                                      //       style: TextStyle(
                                      //           fontSize: 18,
                                      //           color: Colors.orange,
                                      //           fontWeight: FontWeight.bold),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 10,
                                      //     ),
                                      //     Text(
                                      //       '\|${popularList[index].quantity!}',
                                      //       style: TextStyle(
                                      //         fontSize: 18,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person_pin,
                          color: Colors.purple,
                          size: 40,
                        ),
                        title: Text(
                          'Login',
                          style: TextStyle(color: Colors.purple, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.percent_outlined,
                          size: 30,
                        ),
                        title: Text(
                          'Offers',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.card_giftcard,
                          size: 30,
                        ),
                        title: Text(
                          'Coupons',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Divider()
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  leading: Icon(
                    Icons.check_box,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Popular"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.flash_on,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Flash Sales"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.food_bank_outlined,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Food", style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fruits and Vegetables'),
                        Text('Meat & Fish'),
                        Text('Cooking'),
                        Text('Baking'),
                        Text('Dairy'),
                        Text('Candy & Chocolate'),
                        Text('Frozen & Canned'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Personal Care",
                      style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title:
                      Text("Baby Care", style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title:
                      Text("Pet Care", style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Cleaning Supplies",
                      style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Home & kitchen",
                      style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.wash,
                    size: 30,
                    color: Colors.purple,
                  ),
                  title: Text("Toys & Sports",
                      style: TextStyle(color: Colors.black)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spa'),
                        Text('Makeup'),
                        Text('Women\'s care'),
                        Text('Men\'s care'),
                        Text('Oral Care'),
                        Text('Hair'),
                        Text('Skin care'),
                      ],
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
