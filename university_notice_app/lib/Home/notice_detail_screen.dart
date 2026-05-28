import 'package:flutter/material.dart';

class NoticeDetailScreen extends StatelessWidget {

  final String title;
  final String category;
  final String department;
  final String date;
  final int views;
  final bool urgent;

  const NoticeDetailScreen({
    super.key,
    required this.title,
    required this.category,
    required this.department,
    required this.date,
    required this.views,
    required this.urgent,
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Notice Details",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // URGENT BADGE
              if (urgent == true)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
child: const Text(
                    "URGENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // TITLE
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // CATEGORY
              Row(
                children: [
                  const Icon(Icons.category),
                  const SizedBox(width: 8),

                  Text(
                    category,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // DEPARTMENT
              Row(
                children: [
                  const Icon(Icons.account_balance),
                  const SizedBox(width: 8),

                  Text(
                    department,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // DATE
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 8),

                  Text(
                    date,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // VIEWS
              Row(
                children: [
                  const Icon(Icons.visibility),
                  const SizedBox(width: 8),

                  Text(
                    "$views Views",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 20),

              // DESCRIPTION TITLE
              const Text(
                "Notice Description",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // DESCRIPTION
              const Text(
                "This is the complete notice description. "
                "Here admin can write all important details "
                "about examinations, hostel updates, events, "
                "placements, scholarships, and academic circulars.",

                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // PDF BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),

                  onPressed: () {

                    // OPEN PDF HERE

                  },

                  icon: const Icon(Icons.picture_as_pdf),

                  label: const Text(
                    "Download PDF",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}