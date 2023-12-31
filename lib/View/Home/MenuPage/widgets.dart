import 'dart:developer';

import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart' as prov;

import '../OrderPage/CreateOrder/addbutton.dart';
import 'editPage.dart';

class Item extends StatefulWidget {
  Item(
      {super.key,
      required this.image,
      required this.desc,
      required this.price,
      required this.name,
      required this.code,
      required this.tags,
      required this.item});
  String image, desc, name;
  int price;
  RestaurantMenu item;
  String code;
  List<String> tags;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Map<String, String> icons = {
    "Veg": "assets/veg.svg",
    "Non Veg": "assets/non-veg.svg",
    "Alcoholic": "assets/drinks.svg",
    "Non Alcoholic": "assets/drinks.svg",
    "Recommended": "assets/recommend.svg",
    "Best seller": "assets/bestseller.svg",
    "New": "assets/new.svg",
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width - 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width - 35) * 0.25,
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                    width: 132,
                    height: 132,
                  ),
                ),
                Positioned(
                  bottom: -7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => EditPage(
                                    item: widget.item,
                                  )));
                    },
                    child: Container(
                      width: 78.w,
                      height: 29.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4FF),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFF341885)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFF323232),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width - 35) * 0.75) - 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                  width: (MediaQuery.of(context).size.width / 428) * 252 - 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.tags.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: (widget.tags[index] == "Veg" ||
                              widget.tags[index] == "Non Veg")
                          ? SvgPicture.asset(
                              icons[widget.tags[index]]!,
                              width: 20,
                              height: 20,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xff88001f),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Row(children: [
                                Text(widget.tags[index],
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ))
                              ]),
                            ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:
                          (MediaQuery.of(context).size.width / 428) * 252 - 60,
                      child: Text(widget.name,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      width:
                          (MediaQuery.of(context).size.width / 428) * 252 - 60,
                      child: Text("AED ${widget.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 428) * 252 - 60,
                  child: Text(widget.desc,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8C8C8C),
                        fontWeight: FontWeight.w400,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
