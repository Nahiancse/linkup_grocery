import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {
  String? name;
  String? image;
  int? price;
  String? quantity;

  ProductDetail({this.image, this.name, this.price, this.quantity});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'Buy now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.add_box_outlined,
                    size: 40,
                    color: Colors.purple,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
