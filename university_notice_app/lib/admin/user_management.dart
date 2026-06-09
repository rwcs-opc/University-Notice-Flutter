import 'package:flutter/material.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() =>
      _UserManagementScreenState();
}

class _UserManagementScreenState
    extends State<UserManagementScreen> {

  final List<Map<String, dynamic>> users = [
    {
      "name": "Milan Sharma",
      "role": "Student",
      "department": "CSE",
      "email": "milan@smit.edu.in",
      "status": true,
    },
    {
      "name": "Rahul Das",
      "role": "Faculty",
      "department": "ECE",
      "email": "rahul@smit.edu.in",
      "status": true,
    },
    {
      "name": "Ankit Roy",
      "role": "Student",
      "department": "ME",
      "email": "ankit@smit.edu.in",
      "status": false,
    },
    {
      "name": "Admin User",
      "role": "Admin",
      "department": "Administration",
      "email": "admin@smit.edu.in",
      "status": true,
    },
  ];

  int selectedFilter = 0;

  final filters = [
    "All",
    "Students",
    "Faculty",
    "Admins",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton:
          FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        onPressed: () {},

        icon: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),

        label: const Text(
          "Add User",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.purple,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4A148C),
                      Color(0xff7B1FA2),
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
                            Icons.people_alt,
                            size: 55,
                            color: Colors.purple,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "User Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Manage Students, Faculty & Admins",
                          textAlign: TextAlign.center,
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

                  Row(
                    children: [

                      Expanded(
                        child: statCard(
                          "Students",
                          "1250",
                          Icons.school,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Faculty",
                          "120",
                          Icons.person,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Admins",
                          "15",
                          Icons.admin_panel_settings,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration:
                        InputDecoration(
                      hintText:
                          "Search users...",
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

                  SizedBox(
                    height: 45,

                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal,

                      itemCount:
                          filters.length,

                      itemBuilder:
                          (context, index) {

                        bool selected =
                            selectedFilter ==
                                index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter =
                                  index;
                            });
                          },

                          child: Container(
                            margin:
                                const EdgeInsets
                                    .only(
                              right: 10,
                            ),

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),

                            decoration:
                                BoxDecoration(
                              color: selected
                                  ? Colors
                                      .purple
                                  : Colors
                                      .white,

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          25),
                            ),

                            child: Text(
                              filters[index],

                              style:
                                  TextStyle(
                                color:
                                    selected
                                        ? Colors
                                            .white
                                        : Colors
                                            .black,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          SliverList(
            delegate:
                SliverChildBuilderDelegate(
              (context, index) {

                final user =
                    users[index];

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

                              CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                    Colors.purple
                                        .shade100,

                                child: Text(
                                  user["name"][0],

                                  style:
                                      const TextStyle(
                                    fontSize:
                                        24,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
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
                                      user[
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
                                        height:
                                            3),

                                    Text(
                                      user[
                                          "role"],
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal:
                                      10,
                                  vertical: 5,
                                ),

                                decoration:
                                    BoxDecoration(
                                  color: user[
                                          "status"]
                                      ? Colors
                                          .green
                                          .shade100
                                      : Colors
                                          .red
                                          .shade100,

                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              20),
                                ),

                                child: Text(
                                  user["status"]
                                      ? "Active"
                                      : "Inactive",

                                  style:
                                      TextStyle(
                                    color: user[
                                            "status"]
                                        ? Colors
                                            .green
                                        : Colors
                                            .red,

                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            height: 25,
                          ),

                          ListTile(
                            dense: true,
                            leading:
                                const Icon(
                              Icons.school,
                            ),
                            title:
                                const Text(
                                    "Department"),
                            subtitle:
                                Text(user[
                                    "department"]),
                          ),

                          ListTile(
                            dense: true,
                            leading:
                                const Icon(
                              Icons.email,
                            ),
                            title:
                                const Text(
                                    "Email"),
                            subtitle:
                                Text(user[
                                    "email"]),
                          ),

                          const SizedBox(
                              height: 10),

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
                                    Icons.edit,
                                  ),

                                  label:
                                      const Text(
                                    "Edit",
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
                                        Colors.red,
                                  ),

                                  onPressed:
                                      () {},

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
              childCount: users.length,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
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
        padding: const EdgeInsets.all(14),

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
}