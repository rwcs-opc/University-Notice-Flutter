


import 'package:flutter/material.dart';
import '../Home/notice_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, dynamic>> allNotices = [
    {
      "title": "Semester Exam Schedule Released",
      "department": "CSE Department",
      "category": "Examination",
      "date": "20 May 2026",
      "urgent": true,
      "views": 120,
    },
    {
      "title": "Placement Drive by Infosys",
      "department": "Placement Cell",
      "category": "Placement",
      "date": "18 May 2026",
      "urgent": false,
      "views": 95,
    },
    {
      "title": "Scholarship Registration Open",
      "department": "Administration",
      "category": "Scholarship",
      "date": "15 May 2026",
      "urgent": true,
      "views": 210,
    },
    {
      "title": "Hostel Fee Payment Notice",
      "department": "Hostel Department",
      "category": "Hostel",
      "date": "12 May 2026",
      "urgent": false,
      "views": 70,
    },
  ];

  List<Map<String, dynamic>> filteredNotices = [];

  @override
  void initState() {
    super.initState();

    filteredNotices = allNotices;
  }

  void searchNotice(String query) {

    final results = allNotices.where((notice) {

      final title =
          notice["title"].toString().toLowerCase();

      final category =
          notice["category"].toString().toLowerCase();

      final department =
          notice["department"].toString().toLowerCase();

      final input = query.toLowerCase();

      return title.contains(input) ||
          category.contains(input) ||
          department.contains(input);

    }).toList();

    setState(() {
      filteredNotices = results;
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
          "Search Notices",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: Column(
        children: [

          // SEARCH HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  "Find University Notices",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Search by title, category or department",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                // SEARCH BAR
                TextField(
                  controller: searchController,
                  onChanged: searchNotice,

                  decoration: InputDecoration(
                    hintText: "Search notices...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {

                              searchController.clear();

                              searchNotice("");
                            },

                            icon: const Icon(Icons.close),
                          )
                        : null,

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // RESULT COUNT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "Search Results",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "${filteredNotices.length} Found",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // NOTICE LIST
          Expanded(
            child: filteredNotices.isEmpty

                // EMPTY UI
                ? Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: const [

                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 15),

                        Text(
                          "No Notices Found",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )

                // NOTICE CARDS
                : ListView.builder(
                    itemCount: filteredNotices.length,

                    itemBuilder: (context, index) {

                      final notice =
                          filteredNotices[index];

                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: InkWell(
                          borderRadius:
                              BorderRadius.circular(20),

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
                            elevation: 2.5,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(22),
                            ),

                            child: Padding(
                              padding:
                                  const EdgeInsets.all(20),

                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  // TOP ROW
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,

                                    children: [

                                      if (notice["urgent"] ==
                                          true)
                                        Container(
                                          padding:
                                              const EdgeInsets
                                                  .symmetric(
                                            horizontal: 12,
                                            vertical: 5,
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
                                            "URGENT",
                                            style: TextStyle(
                                              color:
                                                  Colors.white,
                                              fontWeight:
                                                  FontWeight
                                                      .bold,
                                            ),
                                          ),
                                        ),

                                      const Icon(
                                        Icons.bookmark_border,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 14),

                                  // TITLE
                                  Text(
                                    notice["title"],

                                    style: const TextStyle(
                                      fontSize: 21,
                                      height: 1.3,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  // DEPARTMENT
                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.account_balance,
                                        size: 18,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 8),

                                      Expanded(
                                        child: Text(
                                          notice[
                                              "department"],

                                          style:
                                              const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight
                                                    .w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // CATEGORY
                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.category,
                                        size: 18,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 8),

                                      Expanded(
                                        child: Text(
                                          notice["category"],

                                          style:
                                              const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight
                                                    .w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // DATE
                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.calendar_month,
                                        size: 18,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 8),

                                      Expanded(
                                        child: Text(
                                          notice["date"],

                                          style:
                                              const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight
                                                    .w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Divider(height: 30),

                                  // BOTTOM ROW
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,

                                    children: [

                                      Row(
                                        children: const [

                                          Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.red,
                                          ),

                                          SizedBox(width: 6),

                                          Text(
                                            "PDF Attached",
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeight
                                                      .w500,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [

                                          const Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          ),

                                          const SizedBox(width: 6),

                                          Text(
                                            notice["views"]
                                                .toString(),
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
          ),
        ],
      ),
    );
  }
}
