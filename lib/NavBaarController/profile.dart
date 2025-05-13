import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const ProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(data['facePhoto'] ?? ''),
              ),
            ),
            const SizedBox(height: 16),

            // Name and Title
            Center(
              child: Text(
                "${data['title'] ?? ''} ${data['firstName']} ${data['lastName']}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(data['email'],
                  style: TextStyle(color: Colors.grey[700])),
            ),
            const Divider(height: 32),

            // Personal Details
            _profileTile("Phone", data['phone']),
            _profileTile("Gender", data['gender']),
            _profileTile(
                "Date of Birth", data['dateOfBirth']?.substring(0, 10)),
            _profileTile("City", data['city']),
            _profileTile("State", data['state']),
            _profileTile("Country", data['country']),
            _profileTile("Pin Code", data['pinCode']),
            _profileTile("Street", "${data['street1']} ${data['street2']}"),
            _profileTile("Town", data['town']),
            _profileTile("Landmark", data['landMark']),
            const Divider(height: 32),

            // Professional Details
            _profileTile("Expertise", (data['expertise'] as List).join(", ")),
            _profileTile("Interest", data['interest']),
            _profileTile("Interested City", data['interestedCity']),
            _profileTile("Year of Experience", data['yearOfExperience']),
            _profileTile("Eligible to work in UK",
                data['eligibleToWorkInUk'] ? "Yes" : "No"),
            _profileTile("Own Car", data['ownCar'] ? "Yes" : "No"),
            _profileTile("License", data['license'] ? "Yes" : "No"),
            _profileTile("Language", data['language']),
            const Divider(height: 32),

            // Documents
            _documentTile("CV", data['cv']),
            _documentTile("Front Passport", data['frontPassport']),
            _documentTile("Back Passport", data['backPassport']),
            const Divider(height: 32),

            // Bank Details
            _profileTile("Account Name", data['accountName']),
            _profileTile("Account Number", data['accountNumber']),
            _profileTile("Bank", data['bank']),
            _profileTile("Sort Code", data['sortCode']),
            _profileTile("UTR Number", data['uniqueTaxPayerReferenceNumber']),
          ],
        ),
      ),
    );
  }

  Widget _profileTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? "N/A")),
        ],
      ),
    );
  }

  Widget _documentTile(String title, String? url) {
    if (url == null || url.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title:", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
