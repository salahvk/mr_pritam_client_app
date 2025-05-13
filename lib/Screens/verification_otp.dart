import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_pritam_client_app/api_client.dart';

import '../CommonButton/common_button.dart';
import 'otp_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    try {
      if (_emailController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your email')),
        );
        _loading = false;
        return;
      }
      if (!_emailController.text.isEmail) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid email')),
        );
        _loading = false;
        return;
      }
      final response = await ApiService.staffLogin(_emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent: ${response.otp}')),
      );
      print('OTP sent: ${response.otp}');
      Get.to(() => OtpScreen(otp: response.otp));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 90.w, left: 10.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  'Verification',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Enter the following Details to\nVerify!',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "Email Address",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    color: Colors.grey.shade200,
                  )),
              elevation: 2,
              child: TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
                  border: InputBorder.none,
                  hintText: "Enter Email Address",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w200,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          _loading
              ? const CircularProgressIndicator()
              : CommonButton(
                  color: const Color(0xffF5A302),
                  title: "SEND OTP",
                  height: 60.h,
                  width: 340.w,
                  fontSize: 18.sp,
                  textColor: Colors.white,
                  onPressed: _login)
        ],
      ),
    );
  }
}
