import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_pritam_client_app/CommonButton/common_button.dart';
import 'package:mr_pritam_client_app/api_client.dart';

import 'forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 10.w),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  Text(
                    "Sign In",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Text(
                "Welcome Back!",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                "Please Enter  your Credentials to Log In",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Enter Email Address",
                          hintStyle: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w200, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Icons.visibility_off,
                            color: Color(0xffF5A302),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: "Enter Pasword",
                          hintStyle: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w200, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CommonButton(
                      title: "LOG IN",
                      color: const Color(0xffF5A302),
                      height: 55,
                      width: 350,
                      fontSize: 18.sp,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => const ForgotPassword(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700, fontSize: 20.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
