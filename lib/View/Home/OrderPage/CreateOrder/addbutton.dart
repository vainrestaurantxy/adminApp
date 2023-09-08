import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getAddButton({required String code, required CartProvider ref,required RestaurantMenu menu}) {
  return ref.cart[code] == 0 || ref.cart[code] == null
      ? GestureDetector(
          onTap: () => ref.addOnTap(code,menu),
          child: Container(
            width: 70.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFF351985)),
                color: const Color(0xFFF4F4FF)),
            child: Center(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
            ),
          ),
        )
      : Container(
          width: 70.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFF351985)),
              color: Color(0xFFF4F4FF)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      ref.subOnTap(code,menu);
                    },
                    child: Icon(
                      Icons.remove,
                      size: 20,
                    )),
                // IconButton(onPressed: (){ref.addOnTap(code: code);}, icon: Icon(Icons.add)),
                Text("${ref.cart[code]}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                GestureDetector(
                    onTap: () {
                      ref.addOnTap(code,menu);
                    },
                    child: Icon(
                      Icons.add,
                      size: 20,
                    )),
                // IconButton(onPressed: (){ref.subOnTap(code: code);}, icon: Icon(Icons.remove)),
              ],
            ),
          ),
        );
}
