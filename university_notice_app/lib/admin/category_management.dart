import 'package:flutter/material.dart';

class CategoryManagementScreen extends StatefulWidget {
  const CategoryManagementScreen({super.key});

  @override
  State<CategoryManagementScreen> createState() =>
      _CategoryManagementScreenState();
}

class _CategoryManagementScreenState
    extends State<CategoryManagementScreen> {

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Academic",
      "icon": Icons.school,
      "color": Colors.blue,
      "count": 32,
    },
    {
      "name": "Examination",
      "icon": Icons.assignment,
      "color": Colors.red,
      "count": 18,
    },
    {
      "name": "Admission",
      "icon": Icons.how_to_reg,
      "color": Colors.green,
      "count": 12,
    },
    {
      "name": "Scholarship",
      "icon": Icons.card_giftcard,
      "color": Colors.orange,
      "count": 8,
    },
    {
      "name": "Placement",
      "icon": Icons.work,
      "color": Colors.purple,
      "count": 25,
    },
    {
      "name": "Events",
      "icon": Icons.event,
      "color": Colors.teal,
      "count": 20,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton:
          FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {},

        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        label: const Text(
          "Add Category",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,

        title: const Text(
          "Category Management",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HEADER

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.category,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Manage Notice Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "${categories.length} Categories Available",
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // STATISTICS

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),

              child: Row(
                children: [

                  Expanded(
                    child: statCard(
                      "Categories",
                      categories.length.toString(),
                      Icons.category,
                      Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: statCard(
                      "Notices",
                      "115",
                      Icons.description,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SEARCH

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),

              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      "Search category...",
                  prefixIcon:
                      const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide:
                        BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TITLE

            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16),

              child: Align(
                alignment:
                    Alignment.centerLeft,

                child: Text(
                  "All Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // CATEGORY LIST

            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),

              itemCount: categories.length,

              itemBuilder:
                  (context, index) {

                final category =
                    categories[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: Card(
                    elevation: 4,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              16),

                      child: Row(
                        children: [

                          Container(
                            height: 60,
                            width: 60,

                            decoration:
                                BoxDecoration(
                              color: category[
                                      "color"]
                                  .withOpacity(
                                      0.15),

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          16),
                            ),

                            child: Icon(
                              category["icon"],
                              color: category[
                                  "color"],
                              size: 32,
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
                                  category[
                                      "name"],
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
                                    height: 5),

                                Text(
                                  "${category["count"]} notices",
                                  style:
                                      TextStyle(
                                    color: Colors
                                        .grey
                                        .shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.edit,
                              color:
                                  Colors.orange,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 100),
          ],
        ),
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
        padding: const EdgeInsets.all(18),

        child: Column(
          children: [

            Icon(
              icon,
              color: color,
              size: 35,
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(title),
          ],
        ),
      ),
    );
  }
}