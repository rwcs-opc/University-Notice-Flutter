import 'package:flutter/material.dart';
import '../models/notice_model.dart';
import '../services/api_service.dart';

class EditNoticeScreen extends StatefulWidget {
  final NoticeModel notice;

  const EditNoticeScreen({
    super.key,
    required this.notice,
  });

  @override
  State<EditNoticeScreen> createState() =>
      _EditNoticeScreenState();
}

class _EditNoticeScreenState
    extends State<EditNoticeScreen> {
  final _formKey = GlobalKey<FormState>();

 late TextEditingController titleController;
late TextEditingController descriptionController;

final ApiService apiService = ApiService();

  String selectedCategory = "Academic";
  String selectedDepartment = "CSE";
  String selectedPriority = "High";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Edit Notice",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme:
            const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: [

              // HEADER

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1565C0),
                      Color(0xff42A5F5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius:
                      BorderRadius.only(
                    bottomLeft:
                        Radius.circular(30),
                    bottomRight:
                        Radius.circular(30),
                  ),
                ),

                child: Column(
                  children: [

                    Container(
                      padding:
                          const EdgeInsets.all(
                              18),

                      decoration:
                          BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius
                                .circular(20),
                      ),

                      child: const Icon(
                        Icons.edit_document,
                        size: 50,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Edit Notice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Modify and manage notice details",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Column(
                  children: [

                    // STATUS CARD

                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(
                              16),

                      decoration:
                          BoxDecoration(
                        color: Colors.green
                            .shade50,

                        borderRadius:
                            BorderRadius
                                .circular(
                                    18),

                        border: Border.all(
                          color: Colors.green
                              .shade200,
                        ),
                      ),

                      child: Row(
                        children: [

                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),

                          const SizedBox(
                              width: 10),

                          const Expanded(
                            child: Text(
                              "Published Notice",
                              style:
                                  TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ),

                          Chip(
                            backgroundColor:
                                Colors.green
                                    .shade100,
                            label:
                                const Text(
                              "LIVE",
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // TITLE

                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child: TextFormField(
                          controller:
                              titleController,

                          decoration:
                              const InputDecoration(
                            labelText:
                                "Notice Title",

                            prefixIcon:
                                Icon(Icons
                                    .title),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // DESCRIPTION

                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child: TextFormField(
                          controller:
                              descriptionController,

                          maxLines: 6,

                          decoration:
                              const InputDecoration(
                            labelText:
                                "Description",

                            alignLabelWithHint:
                                true,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CATEGORY

                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child:
                            DropdownButtonFormField<
                                String>(
                          value:
                              selectedCategory,

                          decoration:
                              const InputDecoration(
                            labelText:
                                "Category",
                          ),

                          items: [
                            "Academic",
                            "Exam",
                            "Events",
                            "Hostel",
                            "Placement"
                          ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(
                                  value: e,
                                  child:
                                      Text(e),
                                ),
                              )
                              .toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedCategory =
                                  value!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // DEPARTMENT

                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child:
                            DropdownButtonFormField<
                                String>(
                          value:
                              selectedDepartment,

                          decoration:
                              const InputDecoration(
                            labelText:
                                "Department",
                          ),

                          items: [
                            "CSE",
                            "ECE",
                            "ME",
                            "CE",
                            "MBA"
                          ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(
                                  value: e,
                                  child:
                                      Text(e),
                                ),
                              )
                              .toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedDepartment =
                                  value!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // PRIORITY

                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child:
                            DropdownButtonFormField<
                                String>(
                          value:
                              selectedPriority,

                          decoration:
                              const InputDecoration(
                            labelText:
                                "Priority",
                          ),

                          items: [
                            "Low",
                            "Medium",
                            "High",
                            "Urgent"
                          ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(
                                  value: e,
                                  child:
                                      Text(e),
                                ),
                              )
                              .toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedPriority =
                                  value!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ATTACHMENT

                    Card(
                      elevation: 3,

                      child: ListTile(
                        leading:
                            const Icon(
                          Icons
                              .picture_as_pdf,
                          color: Colors.red,
                        ),

                        title: const Text(
                          "exam_schedule.pdf",
                        ),

                        subtitle: const Text(
                          "Current Attachment",
                        ),

                        trailing:
                            IconButton(
                          onPressed:
                              () {},

                          icon:
                              const Icon(
                            Icons.delete,
                            color:
                                Colors.red,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // INFO CARDS

                    Row(
                      children: [

                        Expanded(
                          child: infoCard(
                            Icons.category,
                            "Category",
                            selectedCategory,
                          ),
                        ),

                        const SizedBox(
                            width: 10),

                        Expanded(
                          child: infoCard(
                            Icons
                                .priority_high,
                            "Priority",
                            selectedPriority,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // LAST MODIFIED

                    Card(
                      child: ListTile(
                        leading:
                            const Icon(
                          Icons.history,
                          color:
                              Colors.blue,
                        ),

                        title: const Text(
                          "Last Modified",
                        ),

                        subtitle:
                            const Text(
                          "Today • 10:30 AM",
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ACTION BUTTONS

                    Row(
                      children: [

                        Expanded(
                          child:
                              OutlinedButton
                                  .icon(
                            onPressed:
                                () {},

                            icon:
                                const Icon(
                              Icons.delete,
                              color:
                                  Colors.red,
                            ),

                            label:
                                const Text(
                              "Delete",
                              style:
                                  TextStyle(
                                color:
                                    Colors.red,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                            width: 10),

                        Expanded(
                          child:
                              ElevatedButton
                                  .icon(
                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  Colors
                                      .blue,
                            ),

                            // onPressed:
                            //     () {},
                            onPressed: () async {

  final response = await apiService.updateNotice(

    id: widget.notice.id,

    title: titleController.text,

    description: descriptionController.text,

    departmentId: 2,

    categoryId: 2,

    priority: selectedPriority,

    publishDate: widget.notice.date,

    createdBy: 1,
  );

  if (response["status"] == true) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Notice Updated Successfully"),
      ),
    );

    Navigator.pop(context);

  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.toString()),
      ),
    );

  }

},

                            icon:
                                const Icon(
                              Icons.save,
                              color: Colors
                                  .white,
                            ),

                            label:
                                const Text(
                              "Save Changes",
                              style:
                                  TextStyle(
                                color: Colors
                                    .white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // HISTORY

                    Card(
                      elevation: 3,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    20),
                      ),

                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(16),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            const Text(
                              "Notice History",
                              style:
                                  TextStyle(
                                fontSize:
                                    20,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 15),

                            const ListTile(
                              leading: Icon(
                                Icons.add_circle,
                                color:
                                    Colors.green,
                              ),
                              title:
                                  Text(
                                "Created",
                              ),
                              subtitle:
                                  Text(
                                "12 May 2026",
                              ),
                            ),

                            const ListTile(
                              leading: Icon(
                                Icons.edit,
                                color:
                                    Colors.orange,
                              ),
                              title:
                                  Text(
                                "Updated",
                              ),
                              subtitle:
                                  Text(
                                "15 May 2026",
                              ),
                            ),

                            const ListTile(
                              leading: Icon(
                                Icons.public,
                                color:
                                    Colors.blue,
                              ),
                              title:
                                  Text(
                                "Published",
                              ),
                              subtitle:
                                  Text(
                                "16 May 2026",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 3,

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: TextStyle(
                color:
                    Colors.grey.shade600,
              ),
            ),

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
    );
  }
}