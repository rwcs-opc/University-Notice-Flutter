import 'package:flutter/material.dart';

class AdminManagementScreen extends StatelessWidget {
  const AdminManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Add Admin",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: CustomScrollView(
        slivers: [

          // HEADER
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.indigo,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E3A8A),
                      Color(0xff2563EB),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 40),

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.admin_panel_settings,
                        size: 50,
                        color: Colors.indigo,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Admin Management",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Manage all administrators",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                children: [

                  // TOTAL ADMINS CARD
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Row(
                        children: [

                          Container(
                            padding:
                                const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.indigo
                                  .withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.people,
                              color: Colors.indigo,
                              size: 40,
                            ),
                          ),

                          const SizedBox(width: 15),

                          const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                "18",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              Text(
                                "Total Admins",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SEARCH BAR
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search Admins",

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

                  const SizedBox(height: 25),

                  adminCard(
                    name: "Dr. Raj Sharma",
                    email: "raj@university.edu",
                    department: "CSE Department",
                    active: true,
                  ),

                  adminCard(
                    name: "Priya Singh",
                    email: "priya@university.edu",
                    department: "ECE Department",
                    active: true,
                  ),

                  adminCard(
                    name: "Amit Das",
                    email: "amit@university.edu",
                    department: "Mechanical",
                    active: false,
                  ),

                  adminCard(
                    name: "Riya Gupta",
                    email: "riya@university.edu",
                    department: "Civil Engineering",
                    active: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget adminCard({
    required String name,
    required String email,
    required String department,
    required bool active,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      child: Card(
        elevation: 5,

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            children: [

              Row(
                children: [

                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Colors.indigo.shade100,

                    child: const Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          email,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          department,
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Chip(
                    backgroundColor: active
                        ? Colors.green.shade100
                        : Colors.red.shade100,

                    label: Text(
                      active
                          ? "Active"
                          : "Inactive",
                      style: TextStyle(
                        color: active
                            ? Colors.green
                            : Colors.red,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                      ),
                      label: const Text("View"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.indigo,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
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
  }
}