import 'package:flutter/material.dart';
import 'notice_detail_screen.dart';
void main() {
  runApp(const UniversityNoticeApp());
}

class UniversityNoticeApp extends StatelessWidget {
  const UniversityNoticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "University Notice Management",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      "title": "Academic",
      "icon": Icons.school,
      "color": Colors.blue,
    },
    {
      "title": "Exams",
      "icon": Icons.description,
      "color": Colors.red,
    },
    {
      "title": "Events",
      "icon": Icons.event,
      "color": Colors.orange,
    },
    {
      "title": "Hostel",
      "icon": Icons.home,
      "color": Colors.green,
    },
    {
      "title": "Placement",
      "icon": Icons.work,
      "color": Colors.purple,
    },
  ];

  final List<Map<String, dynamic>> notices = const [
    {
      "title": "Semester Exam Schedule Released",
      "department": "CSE Department",
      "category": "Examination",
      "date": "20 May 2026",
      "urgent": true,
      "views": 120,
    },
    {
      "title": "Campus Placement Drive",
      "department": "Training & Placement",
      "category": "Placement",
      "date": "18 May 2026",
      "urgent": false,
      "views": 89,
    },
    {
      "title": "Hostel Fee Submission Notice",
      "department": "Hostel Department",
      "category": "Hostel",
      "date": "15 May 2026",
      "urgent": true,
      "views": 200,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "University Notices",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),

     
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "University Portal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),

            ListTile(
              leading: Icon(Icons.category),
              title: Text("Categories"),
            ),

            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Saved Notices"),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),

     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search notices...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

           
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

           
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {

                  final category = categories[index];

                  return Container(
                    width: 90,
                    margin: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: category["color"],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            category["icon"],
                            color: Colors.white,
                            size: 35,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          category["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Urgent Notices",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notices.length,
              itemBuilder: (context, index) {

                final notice = notices[index];

                return Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  ),

  child: GestureDetector(

    onTap: () {

      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (context) => NoticeDetailScreen(

            title: notice["title"],
            category: notice["category"],
            department: notice["department"],
            date: notice["date"],
            views: notice["views"],
            urgent: notice["urgent"],

          ),
        ),
      );

    },

    child: Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // URGENT BADGE
            if (notice["urgent"] == true)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
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

            const SizedBox(height: 12),

            // TITLE
            Text(
              notice["title"],

              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // DEPARTMENT
            Row(
              children: [

                const Icon(
                  Icons.account_balance,
                  size: 18,
                  color: Colors.grey,
                ),

                const SizedBox(width: 6),

                Text(notice["department"]),
              ],
            ),

            const SizedBox(height: 8),

            // CATEGORY
            Row(
              children: [

                const Icon(
                  Icons.category,
                  size: 18,
                  color: Colors.grey,
                ),

                const SizedBox(width: 6),

                Text(notice["category"]),
              ],
            ),

            const SizedBox(height: 8),

            // DATE
            Row(
              children: [

                const Icon(
                  Icons.calendar_month,
                  size: 18,
                  color: Colors.grey,
                ),

                const SizedBox(width: 6),

                Text(notice["date"]),
              ],
            ),

            const SizedBox(height: 15),

            // BOTTOM ROW
            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                Row(
                  children: const [

                    Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),

                    SizedBox(width: 5),

                    Text("PDF"),
                  ],
                ),

                Row(
                  children: [

                    const Icon(Icons.visibility),

                    const SizedBox(width: 5),

                    Text(
                      notice["views"].toString(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

     
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}