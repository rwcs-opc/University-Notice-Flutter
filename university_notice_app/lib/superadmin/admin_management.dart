import 'package:flutter/material.dart';
import 'add_admin_screen.dart';
import '../../services/api_service.dart';
import '../../models/user_model.dart';
import 'edit_admin_screen.dart';


class AdminManagementScreen extends StatefulWidget {
  const AdminManagementScreen({super.key});

  @override
  State<AdminManagementScreen> createState() => _AdminManagementScreenState();

  
}

// class _AdminManagementScreenState extends State<AdminManagementScreen> {
//   @override
//   Widget build(BuildContext context) {
class _AdminManagementScreenState extends State<AdminManagementScreen> {

  final ApiService apiService = ApiService();

  List<UserModel> admins = [];

  bool isLoading = true;

  @override
void initState() {
  super.initState();
  loadAdmins();
}

Future<void> loadAdmins() async {
  try {
    final data = await apiService.getAdmins();

    setState(() {
      admins = data;
      isLoading = false;
    });

    print("Admins Loaded: ${admins.length}");
  } catch (e) {
    print(e);

    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        // onPressed: () {},
        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const AddAdminScreen(),
    ),
  );
},
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

                          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Text(
      admins.length.toString(),
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),

    const Text(
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

                  if (isLoading)
  const Center(
    child: Padding(
      padding: EdgeInsets.all(30),
      child: CircularProgressIndicator(),
    ),
  )
else
  ...admins.map(
  (admin) => adminCard(
    admin: admin,
  ),
),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget adminCard({
  //   required String name,
  //   required String email,
  //   required String department,
  //   required bool active,
  // }) 
  Widget adminCard({
  required UserModel admin,
})
  {
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
                          admin.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          admin.email,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          admin.role.toUpperCase(),
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Chip(
                    backgroundColor: Colors.green.shade100,
                        // ? Colors.green.shade100
                        // : Colors.red.shade100,

                    label: Text(
                      // true
                      //     ? "Active"
                      //     : "Inactive",
                      "Active",
                      style: TextStyle(
                        // color: true
                        //     ? Colors.green
                        //     : Colors.red,
                        color: Colors.green,
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
                      // onPressed: () {},
                      onPressed: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => EditAdminScreen(
        admin: admin,
      ),
    ),
  );

  if (result == true) {
    loadAdmins();
  }
},
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
                      // onPressed: () {},
                      onPressed: () async {
  await apiService.removeAdmin(admin.id);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
  content: Text("${admin.name} removed as Admin"),
),
  );

  loadAdmins();
},
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