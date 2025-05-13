import 'package:flutter/material.dart';
import 'package:mr_pritam_client_app/api_client.dart';
import 'package:mr_pritam_client_app/models/privacy_model.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({
    super.key,
  });

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  PrivacyData? privacyData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrivacy();
  }

  Future<void> fetchPrivacy() async {
    final response = await ApiService.getPrivacy();
    setState(() {
      privacyData = response[0];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      privacyData?.type ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      privacyData?.privacy ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
