import 'package:flutter/material.dart';
import 'package:link_chaldal/Screens/productDetail.dart';
import 'package:link_chaldal/model/popular.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                          return ProductDetail(
                            name: popularList[index].name,
                            image: popularList[index].img,
                            price: popularList[index].price,
                            quantity: popularList[index].quantity,
                          );
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
                                                      // Center(
                                                      //     child: FittedBox(
                                                      //   child: IconButton(
                                                      //     onPressed: () {},
                                                      //     icon: Icon(
                                                      //       Icons
                                                      //           .remove_circle_outline,
                                                      //       color:
                                                      //           Color(0xFFff666b),
                                                      //       size: 35,
                                                      //     ),
                                                      //   ),
                                                      // )),
                                                      Center(
                                                        child: FittedBox(
                                                          child: IconButton(
                                                            onPressed: () {},
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
                  height: 180,
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
                          style: TextStyle(color: Colors.purple, fontSize: 20),
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
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //       width: MediaQuery.of(context).size.width * 0.85,
            //       child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Icon(
            //             Icons.person_pin,
            //             color: Colors.purple,
            //           ),
            //           Text(
            //             'Login',
            //             style: TextStyle(color: Colors.purple, fontSize: 18),
            //           )
            //         ],
            //       )
            //     ],
            //   )
            //       //  DrawerHeader(
            //       //   decoration: BoxDecoration(
            //       //       image: DecorationImage(
            //       //           image: AssetImage("images/header.jpeg"),
            //       //           fit: BoxFit.cover)),
            //       //   child: Text("Header"),
            //       // ),
            //       ),
            // ),
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
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                // ListTile(
                //   title: Text("Home"),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                // )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
