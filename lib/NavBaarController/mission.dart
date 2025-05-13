import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mr_pritam_client_app/models/mission_model.dart';

class MissionScreen extends StatelessWidget {
  final List<MissionModel> missionData;

  const MissionScreen({super.key, required this.missionData});

  String formatDate(String isoString) {
    final date = DateTime.tryParse(isoString);
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy').format(date);
  }

  String formatTime(String isoString) {
    final date = DateTime.tryParse(isoString);
    if (date == null) return '-';
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final order = missionData.first;
    final allBooking = order.allBookingId;
    final List<String> equipment =
        List<String>.from(allBooking.equipment ?? []);
    final List<String> mobility =
        List<String>.from(allBooking.mobility ?? []);

    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Order Info"),
            infoRow("Order ID", order.orderId),
            infoRow("Date", formatDate(order.date)),
            infoRow("From Time", formatTime(order.fromTime)),
            infoRow("To Time", formatTime(order.toTime)),
            infoRow("Job Status", order.jobStatus),
            const Divider(height: 32),
            sectionTitle("Pricing"),
            infoRow("Subtotal", "₹${order.subTotal}"),
            infoRow("VAT", "₹${order.vat}"),
            infoRow("Total", "₹${order.total}"),
            const Divider(height: 32),
            sectionTitle("Location"),
            infoRow("Name", allBooking.name),
            infoRow("Address", allBooking.address),
            infoRow("City", allBooking.city),
            infoRow("State", allBooking.state),
            infoRow("Pin Code", allBooking.pinCode.toString()),
            const Divider(height: 32),
            sectionTitle("Invoice Details"),
            infoRow("Invoice Name", allBooking.invoiceName),
            infoRow("Invoice Address", allBooking.invoiceAddress),
            infoRow("Invoice City", allBooking.invoiceCity),
            infoRow("Invoice Country", allBooking.invoiceCountry),
            infoRow(
                "Company Reg. No.", allBooking.companyRegistrationNumber),
            infoRow("Invoice Details", allBooking.invoiceDetails),
            const Divider(height: 32),
            if (equipment.isNotEmpty) ...[
              sectionTitle("Equipment"),
              for (var item in equipment) bullet(item),
              const Divider(height: 32),
            ],
            if (mobility.isNotEmpty) ...[
              sectionTitle("Mobility Requirements"),
              for (var item in mobility) bullet(item),
              const Divider(height: 32),
            ],
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );

  Widget infoRow(String label, String? value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: Text("$label:")),
            Expanded(
              flex: 3,
              child: Text(value?.isNotEmpty == true ? value! : '-',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      );

  Widget bullet(String text) => Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• "),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
          ],
        ),
      );
}
