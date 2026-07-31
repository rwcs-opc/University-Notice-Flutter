import 'package:flutter/material.dart';
import 'edit_notice.dart';
import '../services/api_service.dart';
import '../models/notice_model.dart';

class AdminNoticesScreen extends StatefulWidget {
  const AdminNoticesScreen({super.key});

  @override
  State<AdminNoticesScreen> createState() =>
      _AdminNoticesScreenState();
}

class _AdminNoticesScreenState
    extends State<AdminNoticesScreen> {

  // final List<Map<String, dynamic>> notices = [
  //   {
  //     "title": "Semester Exam Schedule",
  //     "category": "Academic",
  //     "status": "Published",
  //     "date": "20 May 2026",
  //     "color": Colors.green,
  //   },
  //   {
  //     "title": "Campus Placement Drive",
  //     "category": "Placement",
  //     "status": "Draft",
  //     "date": "18 May 2026",
  //     "color": Colors.orange,
  //   },
  //   {
  //     "title": "Hostel Fee Submission",
  //     "category": "Hostel",
  //     "status": "Published",
  //     "date": "15 May 2026",
  //     "color": Colors.green,
  //   },
  //   {
  //     "title": "Annual Tech Fest",
  //     "category": "Events",
  //     "status": "Expired",
  //     "date": "10 May 2026",
  //     "color": Colors.red,
  //   },
  // ];

  final ApiService apiService = ApiService();

List<NoticeModel> notices = [];

bool isLoading = true;


@override
void initState() {
  super.initState();
  loadNotices();
}

Future<void> loadNotices() async {
  try {
    final data = await apiService.getNotices();

    setState(() {
      notices = data;
      isLoading = false;
    });
    
  } 
  
  catch (e) {
    print(e);

    setState(() {
      isLoading = false;
    });
  }
}

Color priorityColor(String priority) {
  switch (priority) {
    case "Urgent":
      return Colors.red;

    case "Important":
      return Colors.orange;

    case "Normal":
      return Colors.green;

    default:
      return Colors.blue;
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      backgroundColor: Theme.of(context).colorScheme.primary,

       floatingActionButton:
    //       FloatingActionButton.extended(
    //     // backgroundColor: Colors.blue,
    //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     onPressed: () {},

    //     icon: const Icon(
    //       Icons.add,
    //       color: Colors.white,
    //     ),

    //     label:  Text(
    //       "Create Notice",
    //       style: TextStyle(
    //          color: Colors.white,
    //       // style: TextStyle(
    //       // color: Theme.of(context).colorScheme.onPrimary,
    //  //color: Theme.of(context).colorScheme.onSurface,
    //       ),
    //     ),
    //   ),


    FloatingActionButton.extended(
  backgroundColor: Theme.of(context).colorScheme.primary,
  onPressed: () {},

  icon: Icon(
    Icons.add,
    color: Theme.of(context).colorScheme.onPrimary,
  ),

  label: Text(
    "Create Notice",
    style: TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    ),
  ),
),

      body: CustomScrollView(
        slivers: [

          // PREMIUM HEADER

          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            // backgroundColor: Colors.blue,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1565C0),
                      Color(0xff42A5F5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(20),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

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
                                    .circular(
                                        20),
                          ),

                          child: const Icon(
                            Icons.campaign,
                            size: 50,
                            color: Colors.blue,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Notice Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Manage and monitor university notices",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.all(16),

              child: Column(
                children: [

                  // STATS

                  Row(
                    children: [

                      Expanded(
                        child: statCard(
                          "Total",
                          "120",
                          Icons.description,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Published",
                          "95",
                          Icons.check_circle,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Draft",
                          "25",
                          Icons.edit_note,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // SEARCH

                  TextField(
                    decoration:
                        InputDecoration(
                      hintText:
                          "Search notices...",
                      prefixIcon:
                          const Icon(
                              Icons.search),

                      filled: true,
                      fillColor: Colors.white,

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(18),
                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // FILTER CHIPS

                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal,

                    child: Row(
                      children: [

                        filterChip(
                            "All"),
                        filterChip(
                            "Academic"),
                        filterChip(
                            "Placement"),
                        filterChip(
                            "Events"),
                        filterChip(
                            "Hostel"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // NOTICE LIST

          SliverList(
            delegate:
                SliverChildBuilderDelegate(
              (context, index) {

                final notice =
                    notices[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: Card(
                    elevation: 5,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              22),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              16),

                      child: Column(
                        children: [

                          Row(
                            children: [

                              Container(
                                height: 60,
                                width: 60,

                                decoration:
                                    BoxDecoration(
                                  color: (priorityColor(notice.priority)).withOpacity(0.15),

                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              15),
                                ),

                                child: Icon(
                                  Icons
                                      .description,
                                   color: priorityColor(notice.priority),
                                ),
                              ),

                              const SizedBox(
                                  width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                  children: [

                                    Text(
                                      notice.title,
                                      style:
                                          const TextStyle(
                                        fontSize:
                                            18,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                      ),
                                    ),

                                    const SizedBox(
                                        height:
                                            5),

                                    Text(
                                      notice.category,
                                    ),
                                  ],
                                ),
                              ),

                              PopupMenuButton(
                                itemBuilder:
                                    (context) =>
                                        const [

                                  PopupMenuItem(
                                    value:
                                        "edit",
                                    child:
                                        Text(
                                      "Edit",
                                    ),
                                  ),

                                  PopupMenuItem(
                                    value:
                                        "delete",
                                    child:
                                        Text(
                                      "Delete",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 15),

                          Divider(
                            color: Colors
                                .grey.shade300,
                          ),

                          const SizedBox(
                              height: 10),

                          Row(
                            children: [

                              Chip(
                               backgroundColor: priorityColor(notice.priority).withOpacity(0.2),

                                label: Text(
  notice.priority,
  style: TextStyle(
    color: priorityColor(notice.priority),
    fontWeight: FontWeight.bold,
  ),
),
                              ),

                              const Spacer(),

                              Row(
                                children: [

                                  const Icon(
                                    Icons
                                        .calendar_today,
                                    size: 16,
                                  ),

                                  const SizedBox(
                                      width:
                                          5),

                                  Text(
                                    notice.date,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 15),

                          Row(
                            children: [

                              Expanded(
                                child:
                                //     OutlinedButton
                                //         .icon(
                                //   onPressed:
                                //       () {},

                                //   icon:
                                //       const Icon(
                                //     Icons.edit,
                                //   ),

                                //   label:
                                //       const Text(
                                //     "Edit",
                                //   ),
                                // ),
                                OutlinedButton.icon(
  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoticeScreen(
          notice: notice,
        ),
      ),
    );

  },

  icon: const Icon(Icons.edit),

  label: const Text("Edit"),
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
                                        Colors.red,
                                  ),

                                  // onPressed:
                                  //     () {},
                                  onPressed: () async {

  bool? confirm = await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Delete Notice"),
      content: const Text(
        "Are you sure you want to delete this notice?",
      ),
      actions: [

        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text("Delete"),
        ),
      ],
    ),
  );

  if (confirm != true) return;

  final response =
      await apiService.deleteNotice(
          notice.id);

  if (response["status"] == true) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text("Notice Deleted Successfully"),
      ),
    );

    loadNotices();

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
                                    Icons.delete,
                                    color: Colors
                                        .white,
                                  ),

                                  label:
                                      const Text(
                                    "Delete",
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
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount:
                  notices.length,
            ),
          ),

          const SliverToBoxAdapter(
            child:
                SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            Icon(
              icon,
              color: color,
              size: 30,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget filterChip(String label) {
    return Container(
      margin:
          const EdgeInsets.only(right: 10),

      child: Chip(
        label: Text(label),
      ),
    );
  }
} 