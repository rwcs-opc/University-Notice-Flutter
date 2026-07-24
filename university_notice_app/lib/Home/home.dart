import 'package:flutter/material.dart';
import 'notice_detail_screen.dart';
import '../screen/notification_screen.dart';
import '../screen/category_notices_screen.dart';
import '../services/api_service.dart';
import '../models/notice_model.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();

List<NoticeModel> notices = [];
List<NoticeModel> filteredNotices = [];

bool isLoading = true;
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

// List<NoticeModel> notices = [];
@override
void initState() {
  super.initState();
  loadNotices();
}

// Future<void> loadNotices() async {
//   try {
//     final data = await apiService.getNotices();

//     setState(() {
//       notices = data;
//       isLoading = false;
//     });
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//     });

//     print(e);
//   }
// }
Future<void> loadNotices() async {
  try {
    final data = await apiService.getNotices();

    setState(() {
      notices = data;
      filteredNotices = data;
      isLoading = false;
    });

    print("Loaded ${notices.length} notices");
  } catch (e) {
    print(e);

    setState(() {
      isLoading = false;
    });
  }
}

void searchNotice(String query) {
  setState(() {
    if (query.isEmpty) {
      filteredNotices = notices;
    } else {
      filteredNotices = notices.where((notice) {
        return notice.title
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            notice.description
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            notice.category
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            notice.department
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      
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
        actions: [
  IconButton(
    icon: const Icon(
      Icons.notifications,
      color: Colors.white,
    ),

    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const NotificationScreen(),
        ),
      );
    },
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
                onChanged: searchNotice,
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

           
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
  "Categories",
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onBackground,
  ),
)
            ),

            const SizedBox(height: 10),

           
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {

                  final category = categories[index];

                  // return Container(
                  //   width: 90,
                  //   margin: const EdgeInsets.only(left: 16),
                  //   child: Column(
                  return GestureDetector(

  onTap: () {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => CategoryNoticesScreen(
          categoryName: category["title"],
        ),
      ),
    );
  },

  child: Container(
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
                    )
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

            // ListView.builder(
            isLoading
    ? const Center(
        child: CircularProgressIndicator(),
      )
    : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredNotices.length,
              itemBuilder: (context, index) {

               final notice = filteredNotices[index];

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
  title: notice.title,
  description: notice.description,
  priority: notice.priority,
  publishDate: notice.date,
)
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
            if (notice.urgent)
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
              notice.title,

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

                Text(notice.department),
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
    Text(notice.category),
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

                Text(notice.date),
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
                     notice.views.toString(),
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
    );
  }
}