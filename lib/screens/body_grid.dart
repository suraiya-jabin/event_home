import 'package:flutter/material.dart';
import 'join_page_folder/join_page.dart';

class MyGridView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const MyGridView(
      {super.key, required this.items, required int crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 22.0,
          mainAxisSpacing: 18.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> item = items[index];
          final screenWidth = MediaQuery.of(context).size.width;

          return Builder(
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                        height: screenWidth * 0.22,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: screenWidth * 0.265,
                        left: screenWidth * 0.02,
                        right: screenWidth * 0.05,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (screenWidth * 0.03).toDouble(),
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subtitle'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: (screenWidth * 0.022).toDouble(),
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: screenWidth * 0.014,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: SizedBox(
                          width: double.infinity,
                          height: (screenWidth * 0.075).toDouble(),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinPage()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.indigoAccent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: Text(
                              "Join",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (screenWidth * 0.04).toDouble(),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.18,
                        //bottom: screenWidth * 0.05,
                        left: screenWidth *
                            0.02, // Adjusted position of the CircleAvatar
                        child: Container(
                          width: (screenWidth * 0.08).toDouble(),
                          height: (screenWidth * 0.08).toDouble(),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 2.0,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.people_rounded,
                              size: (screenWidth * 0.04).toDouble(),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
