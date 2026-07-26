import 'package:flutter/material.dart';
import '../models/notice_model.dart';
import '../services/api_service.dart';
import '../Home/notice_detail_screen.dart';


class CategoryNoticesScreen extends StatefulWidget {
  final String categoryName;

  const CategoryNoticesScreen({
    super.key,
    required this.categoryName,
  });

  @override
  State<CategoryNoticesScreen> createState() => _CategoryNoticesScreenState();
}

class _CategoryNoticesScreenState extends State<CategoryNoticesScreen> {
  final ApiService apiService = ApiService();

List<NoticeModel> notices = [];

bool isLoading = true;
@override
void initState() {
  super.initState();
  loadCategoryNotices();
}

Future<void> loadCategoryNotices() async {
  try {
    final data = await apiService.getCategoryNotices(
      widget.categoryName,
    );

    setState(() {
      notices = data;
      isLoading = false;
    });

  } catch (e) {
    setState(() {
      isLoading = false;
    });

    print(e);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          // HEADER
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

                Text(
                  "${widget.categoryName} Notices",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Latest notices and announcements",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
  child: isLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : ListView.builder(
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
                      builder: (_) =>
                      //  NoticeDetailScreen(
                      //   title: notice.title,
                      //   description: notice.description,
                      //   priority: notice.priority,
                      //   publishDate: notice.date,
                      // ),
                      NoticeDetailScreen(
  title: notice.title,
  description: notice.description,
  priority: notice.priority,
  publishDate: notice.date,
  pdf: notice.pdf,
)
                    ),
                  );
                },

                child: Card(
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Padding(
                    padding:
                        const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        if (notice.urgent)
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "URGENT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                        const SizedBox(height: 10),

                        Text(
                          notice.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(notice.description),

                        const SizedBox(height: 15),

                        Row(
                          children: [

                            const Icon(
                              Icons.account_balance,
                              size: 18,
                            ),

                            const SizedBox(width: 8),

                            Text(notice.department),

                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [

                            const Icon(
                              Icons.calendar_month,
                              size: 18,
                            ),

                            const SizedBox(width: 8),

                            Text(notice.date),

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