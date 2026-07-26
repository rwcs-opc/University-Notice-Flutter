// import 'package:flutter/material.dart';
// import '../Home/notice_detail_screen.dart';
// // Modern Production Style Saved Notices Screen

// class SavedScreen extends StatelessWidget {
//   const SavedScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final List<Map<String, dynamic>> savedNotices = [
//       {
//         "title": "Semester Exam Schedule Released",
//         "department": "CSE Department",
//         "category": "Examination",
//         "date": "20 May 2026",
//         "urgent": true,
//         "views": 120,
//       },
//       {
//         "title": "Placement Drive by TCS",
//         "department": "Training & Placement",
//         "category": "Placement",
//         "date": "18 May 2026",
//         "urgent": false,
//         "views": 89,
//       },
//       {
//         "title": "Scholarship Form Submission",
//         "department": "Administration",
//         "category": "Scholarship",
//         "date": "15 May 2026",
//         "urgent": true,
//         "views": 200,
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,

//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         title: const Text(
//           "Saved Notices",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16),
//             child: Icon(
//               Icons.bookmark,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),

//       body: Column(
//         children: [

//           // TOP INFO CARD
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(20),

//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Colors.blue,
//                   Colors.lightBlueAccent,
//                 ],
//               ),

//               borderRadius: BorderRadius.circular(25),
//             ),

//             child: Row(
//               children: [

//                 const CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.white,

//                   child: Icon(
//                     Icons.bookmark,
//                     color: Colors.blue,
//                     size: 30,
//                   ),
//                 ),

//                 const SizedBox(width: 18),

//                 Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,

//                   children: [

//                     const Text(
//                       "Saved Notices",

//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: 5),

//                     Text(
//                       "${savedNotices.length} Notices Saved",

//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // SAVED NOTICE LIST
//           Expanded(
//             child: ListView.builder(

//               itemCount: savedNotices.length,

//               itemBuilder: (context, index) {

//                 final notice = savedNotices[index];

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 8,
//                   ),

//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: () {

//   Navigator.push(

//     context,

//     MaterialPageRoute(

//       builder: (context) => NoticeDetailScreen(

//         title: notice["title"],
//         category: notice["category"],
//         department: notice["department"],
//         date: notice["date"],
//         views: notice["views"],
//         urgent: notice["urgent"],

//       ),
//     ),
//   );
// },

//                     child: Card(
//                     elevation: 2.5,

//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(22),
//                     ),

//                     child: Padding(
//                       padding: const EdgeInsets.all(20),

//                       child: Column(
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,

//                         children: [

//                           // TOP ROW
//                           Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,

//                             children: [

//                               // URGENT BADGE
//                               if (notice["urgent"] == true)
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.symmetric(
//                                     horizontal: 12,
//                                     vertical: 5,
//                                   ),

//                                   decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius:
//                                         BorderRadius.circular(20),
//                                   ),

//                                   child: const Text(
//                                     "URGENT",

//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),

//                               IconButton(
//                                 onPressed: () {

//                                   // REMOVE SAVED NOTICE

//                                 },

//                                 icon: const Icon(
//                                   Icons.bookmark,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 12),

//                           // TITLE
//                           Text(
//                             notice["title"],

//                             style: const TextStyle(
//                               fontSize: 21,
//                               height: 1.3,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),

//                           const SizedBox(height: 15),

//                           // DEPARTMENT
//                           Row(
//                             children: [

//                               const Icon(
//                                 Icons.account_balance,
//                                 size: 18,
//                                 color: Colors.grey,
//                               ),

//                               const SizedBox(width: 8),

//                               Expanded(
//                                 child: Text(
//                                   notice["department"],
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 10),

//                           // CATEGORY
//                           Row(
//                             children: [

//                               const Icon(
//                                 Icons.category,
//                                 size: 18,
//                                 color: Colors.grey,
//                               ),

//                               const SizedBox(width: 8),

//                               Expanded(
//                                 child: Text(
//                                   notice["category"],
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 10),

//                           // DATE
//                           Row(
//                             children: [

//                               const Icon(
//                                 Icons.calendar_month,
//                                 size: 18,
//                                 color: Colors.grey,
//                               ),

//                               const SizedBox(width: 8),

//                               Expanded(
//                                 child: Text(
//                                   notice["date"],
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 18),

//                           const Divider(height: 30),

//                           // BOTTOM ROW
//                           Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,

//                             children: [

//                               Row(
//                                 children: const [

//                                   Icon(
//                                     Icons.picture_as_pdf,
//                                     color: Colors.red,
//                                   ),

//                                   SizedBox(width: 6),

//                                   Text(
//                                     "PDF Attached",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               Row(
//                                 children: [

//                                   const Icon(
//                                     Icons.visibility,
//                                     color: Colors.grey,
//                                   ),

//                                   const SizedBox(width: 6),

//                                   Text(
//                                     notice["views"].toString(),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                                         ),
//                   ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../Home/notice_detail_screen.dart';
import '../models/notice_model.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NoticeModel> savedNotices = [
      NoticeModel(
  id: 1,
  title: "Semester Exam Schedule Released",
  description: "Semester examination schedule has been released.",
  priority: "High",
  date: "20 May 2026",
  category: "Examination",
  department: "CSE Department",
  views: 120,
  urgent: true,
),
      NoticeModel(
    id: 2,
    title: "Placement Drive by TCS",
    description:
        "TCS is conducting a placement drive for final-year students. Interested students should register before the deadline.",
    priority: "Medium",
    date: "18 May 2026",
    category: "Placement",
    department: "Training & Placement",
    views: 89,
    urgent: false,
  ),
       NoticeModel(
    id: 3,
    title: "Scholarship Form Submission",
    description:
        "Students are requested to submit their scholarship application forms before the last date along with all required documents.",
    priority: "High",
    date: "15 May 2026",
    category: "Scholarship",
    department: "Administration",
    views: 200,
    urgent: true,
  ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Notices"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: savedNotices.length,
        itemBuilder: (context, index) {
          final notice = savedNotices[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(notice.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Priority: ${notice.priority}"),
                  Text("Published: ${notice.date}"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("Notice PDF: ${notice.pdf}");
                print("Notice Image: ${notice.image}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NoticeDetailScreen(
                      title: notice.title,
                      description: notice.description,
                      priority: notice.priority,
                      publishDate: notice.date,
                         pdf: notice.pdf,
                      image: notice.image,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}