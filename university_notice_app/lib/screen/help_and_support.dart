import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Help & Support",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ======================
            // TOP BANNER
            // ======================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: const [

                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.support_agent,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "How can we help you?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Get support, report issues, and find answers quickly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ======================
            // QUICK ACTIONS
            // ======================

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  Expanded(
                    child: quickCard(
                      Icons.email,
                      "Email Us",
                      Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: quickCard(
                      Icons.call,
                      "Call Us",
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  Expanded(
                    child: quickCard(
                      Icons.bug_report,
                      "Report Bug",
                      Colors.red,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: quickCard(
                      Icons.feedback,
                      "Feedback",
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================
            // CONTACT INFO
            // ======================

            sectionTitle("Contact Information"),

            infoTile(
              Icons.email,
              "support@university.edu",
              Colors.blue,
            ),

            infoTile(
              Icons.phone,
              "+91 9876543210",
              Colors.green,
            ),

            infoTile(
              Icons.location_on,
              "University Campus, India",
              Colors.red,
            ),

            const SizedBox(height: 20),

            // ======================
            // FAQ SECTION
            // ======================

            sectionTitle("Frequently Asked Questions"),

            faqTile(
              "How do I download a notice?",
              "Open the notice and tap on the PDF attachment.",
            ),

            faqTile(
              "How can I save notices?",
              "Click the bookmark icon on any notice.",
            ),

            faqTile(
              "How do I update my profile?",
              "Go to Profile > Edit Profile.",
            ),

            faqTile(
              "How do notifications work?",
              "You'll receive alerts when new notices are published.",
            ),

            const SizedBox(height: 20),

            // ======================
            // APP INFO
            // ======================

            sectionTitle("Application Information"),

            Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.blue,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "University Notice Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Version 1.0.0",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ======================
            // BUTTON
            // ======================

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {},

                  icon: const Icon(
                    Icons.support_agent,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Contact Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ==========================
  // WIDGETS
  // ==========================

  static Widget quickCard(
      IconData icon,
      String title,
      Color color) {
    return Card(
      elevation: 3,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),

        child: Column(
          children: [

            Icon(
              icon,
              color: color,
              size: 35,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget infoTile(
      IconData icon,
      String title,
      Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(title),
      ),
    );
  }

  static Widget faqTile(
      String question,
      String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),

      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),

        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}