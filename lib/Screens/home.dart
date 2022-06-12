import 'package:flutter/material.dart';
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
      appBar: AppBar(backgroundColor: Colors.white, title: Text('')),
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
                    return Column(
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Icon(Icons.storm)
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
                                                    MainAxisAlignment
                                                        .start,
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
                                              flex:4,
                                              child:Center(
                                                child:Container(
                                                  child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Center(
                                              child: FittedBox(
                                              child: IconButton(
                                                onPressed: () {
                                                  
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Color(0xFFff666b),
                                                  size: 35,
                                                ),
                                              ),
                                            )),
                                            Center(
                                        child: FittedBox(
                                          child: IconButton(
                                            onPressed: () {
                                             
                                            },
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Color(0xFFff666b),
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      )
                                                    ],
                                                  )
                                                )
                                              )
                                            )
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
