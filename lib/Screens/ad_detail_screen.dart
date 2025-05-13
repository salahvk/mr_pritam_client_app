import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdDetailScreen extends StatelessWidget {
  final Map<String, dynamic> adData;

  const AdDetailScreen({super.key, required this.adData});

  void _launchYouTube(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String title = adData['title'] ?? '';
    final String description = adData['description'] ?? '';
    final String link = adData['link'] ?? '';
    final String image = adData['image'] ?? '';
    final String banner = adData['banner'] ?? '';
    final List<String> descList = List<String>.from(adData['desc'] ?? []);
    final List<String> extraImages = List<String>.from(adData['images'] ?? []);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (banner.isNotEmpty)
              Image.network(banner, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            if (image.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description.trim(),
                  style: const TextStyle(fontSize: 16)),
            ),
            if (descList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Details:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    ...descList.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text("• $e",
                              style: const TextStyle(fontSize: 15)),
                        ))
                  ],
                ),
              ),
            if (extraImages.isNotEmpty)
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: extraImages.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(extraImages[index]),
                    ),
                  ),
                ),
              ),
            if (link.isNotEmpty)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => _launchYouTube(link),
                  icon: const Icon(Icons.play_circle),
                  label: const Text("Watch Video"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
