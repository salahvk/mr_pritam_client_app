import 'package:flutter/material.dart';
import 'package:mr_pritam_client_app/api_client.dart';
import 'package:mr_pritam_client_app/models/privacy_model.dart';
import 'package:mr_pritam_client_app/models/terms_model.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({
    super.key,
  });

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  TermsData? termsData;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchTerms();
  }

  Future<void> fetchTerms() async {
    final response = await ApiService.getTerms();
    setState(() {
      termsData = response[0];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      termsData?.type ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      termsData?.terms ?? '',
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
