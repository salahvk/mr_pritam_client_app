import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_screen.dart';
import 'notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> data = [
    {
      "image": "assets/images/workin.png",
      "price": "50",
      "title": "Ongoing Job",
      "subtitle": "VIEW ALL>"
    },
    {
      "image": "assets/images/workin.png",
      "price": "50",
      "title": "Mission Completed",
      "subtitle": "VIEW ALL>"
    },
    {
      "image": "assets/images/workin.png",
      "price": "50",
      "title": "Total Job Posted"
    },
    {
      "image": "assets/images/workin.png",
      "price": "50",
      "title": "Total Invoices"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Home",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () => const NotificationScreen(),
                                    transition: Transition.fadeIn,
                                    duration: Duration(milliseconds: 500),
                                  );
                                },
                                child: Image.asset(
                                    "assets/images/notification.png",
                                    height: 30,
                                    width: 30),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const CartScreen(),
                                      transition: Transition.fadeIn);
                                },
                                child: Image.asset(
                                  "assets/images/cart.png",
                                  height: 30,
                                  width: 30,
                                  color: const Color(0xff384F6C),
                                ),
                              ),
                              Text(
                                "CART",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff384F6C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      items: [
                        Image.asset("assets/images/ceftt.png"),
                        Image.asset("assets/images/insta.png"),
                        Image.asset("assets/images/fscreen.png"),
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1),
                    ),
                    Card(
                      color: Color(0xfffff2d8),
                      child: SizedBox(
                        height: 100,
                        width: 350,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_circle,
                                  color: Color(0xffF5A302),
                                  size: 45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "ADD JOB",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffF5A302),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: Text(
                              "Find your Temporary Staff",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Text(
                      "My Dashboard",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              2 / 2.7, // Aspect ratio for grid items
                        ),
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffff2d8),
                              // color: const Color.fromARGB(25, 163, 5, 03),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (item["image"] != null)
                                  Image.asset(
                                    item["image"]!,
                                    height: 70,
                                    width: 70,
                                  ),
                                SizedBox(height: 20.h),
                                if (item["title"] != null)
                                  Text(
                                    item["title"]!,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                SizedBox(height: 10.h),
                                if (item["price"] != null)
                                  Text(
                                    "\$${item["price"]}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff384F6C),
                                    ),
                                  ),
                                SizedBox(height: 10.h),
                                if (item["subtitle"] != null)
                                  Text(
                                    item["subtitle"]!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff595959B2),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 273, left: 25),
                child: Image.asset(
                  "assets/images/box.png",
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
