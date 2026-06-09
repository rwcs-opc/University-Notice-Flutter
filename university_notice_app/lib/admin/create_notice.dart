import 'package:flutter/material.dart';

class CreateNoticeScreen extends StatefulWidget {
  const CreateNoticeScreen({super.key});

  @override
  State<CreateNoticeScreen> createState() =>
      _CreateNoticeScreenState();
}

class _CreateNoticeScreenState
    extends State<CreateNoticeScreen> {

  final titleController = TextEditingController();
  final descriptionController =
      TextEditingController();

  String selectedCategory = "Academic";
  String selectedDepartment = "CSE";
  String selectedPriority = "Normal";

  DateTime? publishDate;
  DateTime? expiryDate;

  final List<String> categories = [
    "Academic",
    "Examination",
    "Admission",
    "Scholarship",
    "Hostel",
    "Placement",
    "Events",
    "Circular",
  ];

  final List<String> departments = [
    "CSE",
    "ECE",
    "ME",
    "CE",
    "MBA",
  ];

  final List<String> priorities = [
    "Normal",
    "Important",
    "Urgent",
  ];

  Future<void> pickPublishDate() async {
    DateTime? picked =
        await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        publishDate = picked;
      });
    }
  }

  Future<void> pickExpiryDate() async {
    DateTime? picked =
        await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        expiryDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Create Notice",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // HEADER CARD

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: const Column(
                children: [

                  Icon(
                    Icons.campaign,
                    size: 50,
                    color: Colors.white,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Publish New Notice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Create and publish notices for students",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // NOTICE TITLE

            const Text(
              "Notice Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText:
                    "Enter notice title",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION

            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller:
                  descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Enter notice description",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CATEGORY

            dropdownSection(
              "Category",
              selectedCategory,
              categories,
              (value) {
                setState(() {
                  selectedCategory =
                      value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // DEPARTMENT

            dropdownSection(
              "Department",
              selectedDepartment,
              departments,
              (value) {
                setState(() {
                  selectedDepartment =
                      value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // PRIORITY

            dropdownSection(
              "Priority",
              selectedPriority,
              priorities,
              (value) {
                setState(() {
                  selectedPriority =
                      value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // DATES

            Row(
              children: [

                Expanded(
                  child: dateCard(
                    title:
                        "Publish Date",
                    value:
                        publishDate ==
                                null
                            ? "Select"
                            : "${publishDate!.day}/${publishDate!.month}/${publishDate!.year}",
                    icon:
                        Icons.calendar_month,
                    onTap:
                        pickPublishDate,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: dateCard(
                    title:
                        "Expiry Date",
                    value:
                        expiryDate ==
                                null
                            ? "Select"
                            : "${expiryDate!.day}/${expiryDate!.month}/${expiryDate!.year}",
                    icon:
                        Icons.event_busy,
                    onTap:
                        pickExpiryDate,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ATTACHMENTS

            const Text(
              "Attachments",
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                Expanded(
                  child: attachmentButton(
                    Icons.picture_as_pdf,
                    "Upload PDF",
                    Colors.red,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: attachmentButton(
                    Icons.image,
                    "Upload Image",
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // ACTION BUTTONS

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},

                    style:
                        OutlinedButton.styleFrom(
                      minimumSize:
                          const Size(
                              double.infinity,
                              55),
                    ),

                    child: const Text(
                      "Save Draft",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue,
                      minimumSize:
                          const Size(
                              double.infinity,
                              55),
                    ),

                    child: const Text(
                      "Publish",
                      style: TextStyle(
                        color:
                            Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget dropdownSection(
    String title,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField(
          value: value,

          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),

          onChanged: onChanged,

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      15),
            ),
          ),
        ),
      ],
    );
  }

  Widget dateCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.all(16),

          child: Column(
            children: [

              Icon(icon,
                  color: Colors.blue),

              const SizedBox(height: 8),

              Text(title),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget attachmentButton(
    IconData icon,
    String text,
    Color color,
  ) {
    return OutlinedButton.icon(
      onPressed: () {},

      icon: Icon(
        icon,
        color: color,
      ),

      label: Text(text),

      style: OutlinedButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 55),
      ),
    );
  }
}