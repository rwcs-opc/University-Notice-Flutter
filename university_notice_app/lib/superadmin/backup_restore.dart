import 'package:flutter/material.dart';

class BackupRestoreScreen extends StatefulWidget {
  const BackupRestoreScreen({super.key});

  @override
  State<BackupRestoreScreen> createState() =>
      _BackupRestoreScreenState();
}

class _BackupRestoreScreenState
    extends State<BackupRestoreScreen> {
  bool autoBackup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [

          // HEADER
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.teal,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0F766E),
                      Color(0xff14B8A6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 40),

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.backup,
                        size: 50,
                        color: Colors.teal,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Backup & Restore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Secure your system data",
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

                  // LAST BACKUP
                  Card(
                    elevation: 5,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              20),

                      child: Row(
                        children: [

                          Container(
                            padding:
                                const EdgeInsets
                                    .all(15),

                            decoration:
                                BoxDecoration(
                              color: Colors.teal
                                  .withOpacity(
                                      0.1),
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                            ),

                            child: const Icon(
                              Icons.history,
                              color:
                                  Colors.teal,
                              size: 40,
                            ),
                          ),

                          const SizedBox(
                              width: 15),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [

                                Text(
                                  "Last Backup",
                                  style:
                                      TextStyle(
                                    color: Colors
                                        .grey,
                                  ),
                                ),

                                SizedBox(
                                    height: 5),

                                Text(
                                  "10 June 2026",
                                  style:
                                      TextStyle(
                                    fontSize:
                                        22,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                Text(
                                  "02:30 AM",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 20),

                  // STORAGE CARD
                  Card(
                    elevation: 5,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              20),

                      child: Column(
                        children: [

                          const Row(
                            children: [

                              Icon(
                                Icons.storage,
                                color:
                                    Colors.blue,
                              ),

                              SizedBox(
                                  width: 10),

                              Text(
                                "Storage Usage",
                                style:
                                    TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize:
                                      18,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 20),

                          LinearProgressIndicator(
                            value: 0.65,
                            minHeight: 10,
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        10),
                          ),

                          const SizedBox(
                              height: 10),

                          const Align(
                            alignment:
                                Alignment
                                    .centerRight,
                            child: Text(
                              "65% Used",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 20),

                  // AUTO BACKUP
                  Card(
                    elevation: 5,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: SwitchListTile(
                      value: autoBackup,

                      onChanged: (value) {
                        setState(() {
                          autoBackup =
                              value;
                        });
                      },

                      title: const Text(
                        "Automatic Backup",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      subtitle: const Text(
                        "Daily backup at 2:00 AM",
                      ),

                      secondary:
                          const Icon(
                        Icons.autorenew,
                        color:
                            Colors.green,
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 25),

                  // BUTTONS
                  Row(
                    children: [

                      Expanded(
                        child:
                            ElevatedButton.icon(
                          onPressed: () {},

                          icon:
                              const Icon(
                            Icons.backup,
                            color: Colors
                                .white,
                          ),

                          label:
                              const Text(
                            "Create Backup",
                            style:
                                TextStyle(
                              color: Colors
                                  .white,
                            ),
                          ),

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                Colors.teal,
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                          width: 12),

                      Expanded(
                        child:
                            ElevatedButton.icon(
                          onPressed: () {},

                          icon:
                              const Icon(
                            Icons.restore,
                            color: Colors
                                .white,
                          ),

                          label:
                              const Text(
                            "Restore",
                            style:
                                TextStyle(
                              color: Colors
                                  .white,
                            ),
                          ),

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                Colors.orange,
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 30),

                  // BACKUP HISTORY
                  const Align(
                    alignment:
                        Alignment.centerLeft,
                    child: Text(
                      "Backup History",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 15),

                  backupTile(
                    "Daily Backup",
                    "10 June 2026",
                    "2.4 GB",
                    Icons.check_circle,
                    Colors.green,
                  ),

                  backupTile(
                    "Weekly Backup",
                    "08 June 2026",
                    "2.2 GB",
                    Icons.check_circle,
                    Colors.green,
                  ),

                  backupTile(
                    "Monthly Backup",
                    "01 June 2026",
                    "2.0 GB",
                    Icons.check_circle,
                    Colors.green,
                  ),

                  const SizedBox(
                      height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget backupTile(
    String title,
    String date,
    String size,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,

      margin:
          const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(title),

        subtitle:
            Text("$date • $size"),

        trailing: const Icon(
          Icons.download,
        ),
      ),
    );
  }
}