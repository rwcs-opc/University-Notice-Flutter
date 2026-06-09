import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatelessWidget {
  final String title;

  const AdminDetailsScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: Colors.indigo,

            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),

              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3949AB),
                      Color(0xff5C6BC0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: SafeArea(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Container(
                        padding:
                            const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(25),
                        ),

                        child: Icon(
                          getIcon(),
                          size: 60,
                          color: Colors.indigo,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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

                  // SEARCH

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon:
                          const Icon(Icons.search),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // STATS

                  Row(
                    children: [

                      Expanded(
                        child: statCard(
                          "Today",
                          "25",
                          Icons.today,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Weekly",
                          "70",
                          Icons.calendar_month,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Monthly",
                          "120",
                          Icons.bar_chart,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // LIST

                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),

                    itemCount: 10,

                    itemBuilder: (context, index) {

                      return Card(
                        margin:
                            const EdgeInsets.only(
                          bottom: 15,
                        ),

                        elevation: 4,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  20),
                        ),

                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.all(
                                  15),

                          leading: CircleAvatar(
                            radius: 28,
                            backgroundColor:
                                Colors.indigo.shade100,

                            child: Icon(
                              getIcon(),
                              color: Colors.indigo,
                            ),
                          ),

                          title: Text(
                            "$title ${index + 1}",
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          subtitle: const Text(
                            "Updated recently",
                          ),

                          trailing: PopupMenuButton(
                            itemBuilder: (_) => const [

                              PopupMenuItem(
                                child: Text("View"),
                              ),

                              PopupMenuItem(
                                child: Text("Edit"),
                              ),

                              PopupMenuItem(
                                child: Text("Delete"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData getIcon() {

    if (title.contains("User")) {
      return Icons.people;
    }

    if (title.contains("Pendin")) {
      return Icons.pending_actions;
    }

    if (title.contains("Published")) {
      return Icons.check_circle;
    }

    return Icons.description;
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
        padding:
            const EdgeInsets.all(12),

        child: Column(
          children: [

            Icon(
              icon,
              color: color,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Text(title),
          ],
        ),
      ),
    );
  }
}