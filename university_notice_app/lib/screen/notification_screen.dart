import 'package:flutter/material.dart';
import '../Home/notice_detail_screen.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final List<Map<String, dynamic>> notifications = [
      {
        "title": "Semester Exam Schedule Released",
        "message":
            "Check the latest examination timetable.",
        "time": "2 hours ago",
        "isNew": true,
      },
      {
        "title": "TCS Placement Drive",
        "message":
            "Registration for TCS placement drive is now open.",
        "time": "Yesterday",
        "isNew": true,
      },
      {
        "title": "Scholarship Registration",
        "message":
            "Last date for scholarship applications is approaching.",
        "time": "2 days ago",
        "isNew": false,
      },
      {
        "title": "Hostel Fee Reminder",
        "message":
            "Please pay your hostel fees before the deadline.",
        "time": "3 days ago",
        "isNew": false,
      },
    ];

    return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          // HEADER CARD
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),

            child: Row(
              children: [

                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Recent Updates",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "${notifications.length} Notifications",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,

              itemBuilder: (context, index) {

                final notification =
                    notifications[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: Card(
                    elevation: 2,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: ListTile(

                       onTap: () {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => NoticeDetailScreen(
          title: notification["title"],
          category: "Notification",
          department: "University",
          date: notification["time"],
          views: 0,
          urgent: notification["isNew"],
        ),
      ),
    );
  },


                      contentPadding:
                          const EdgeInsets.all(16),

                      leading: CircleAvatar(
                        backgroundColor:
                            notification["isNew"] == true
                                ? Colors.red.shade100
                                : Colors.blue.shade100,

                        child: Icon(
                          notification["isNew"] == true
                              ? Icons.campaign
                              : Icons.notifications,

                          color:
                              notification["isNew"] == true
                                  ? Colors.red
                                  : Colors.blue,
                        ),
                      ),

                      title: Text(
                        notification["title"]
                            .toString(),

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const SizedBox(height: 8),

                          Text(
                            notification["message"]
                                .toString(),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            notification["time"]
                                .toString(),

                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      trailing:
                          notification["isNew"] == true
                              ? Container(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),

                                  decoration:
                                      BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                20),
                                  ),

                                  child: const Text(
                                    "NEW",
                                    style: TextStyle(
                                      color:
                                          Colors.white,
                                      fontSize: 12,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                )
                              : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}