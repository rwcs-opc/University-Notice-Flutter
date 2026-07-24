import 'package:flutter/material.dart';

class NoticeDetailScreen extends StatelessWidget {

 final String title;
final String description;
final String priority;
final String publishDate;

  const NoticeDetailScreen({
  super.key,
  required this.title,
  required this.description,
  required this.priority,
  required this.publishDate,
});
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Notice Details",
          style: TextStyle(color: Colors.white),
        ),
      ),

     body: SingleChildScrollView(

  child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      // TOP HEADER
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

            const SizedBox(height: 10),

            // URGENT BADGE
            if (priority.toLowerCase() == "high")
              Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: Colors.red.shade400,
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

            const SizedBox(height: 20),

            // TITLE
            Text(

              title,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // DATE & VIEWS
            Row(

              children: [

                const Icon(
                  Icons.calendar_month,
                  color: Colors.white70,
                ),

                const SizedBox(width: 6),

                Text(
                  publishDate,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(width: 20),

                
              ],
            ),
          ],
        ),
      ),

      const SizedBox(height: 25),

      // INFORMATION CARD
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Card(

          elevation: 3,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

               

                const SizedBox(height: 20),

                Row(
                  children: [

                    const CircleAvatar(
                      backgroundColor: Colors.orange,

                      child: Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Category",

                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        Text(

                          priority,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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

      const SizedBox(height: 25),

      // DESCRIPTION SECTION
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(

              "Notice Description",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

             Text(
               description,

              style:const TextStyle(
                fontSize: 17,
                height: 1.7,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 30),

      // PDF BUTTON
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: SizedBox(

          width: double.infinity,
          height: 55,

          child: ElevatedButton.icon(

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            onPressed: () {},

            icon: const Icon(Icons.picture_as_pdf),

            label: const Text(
              "Download PDF",

              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),

      const SizedBox(height: 30),
    ],
  ),
),
    );
  }
}