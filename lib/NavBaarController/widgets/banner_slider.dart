import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mr_pritam_client_app/api_client.dart';
import 'package:mr_pritam_client_app/models/banner_model.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  late Future<List<BannerModel>> banners;

  @override
  void initState() {
    super.initState();
    banners = ApiService.getAllBanners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: banners,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No banners available");
        }

        return CarouselSlider(
          items: snapshot.data!.map((banner) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                banner.bannerImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
        );
      },
    );
  }
}
