import 'package:event_home/screens/join_page_folder/build_group_card.dart';
import 'package:event_home/screens/join_page_folder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'build_post.dart';
import 'build_button_row.dart';

class JoinPage extends StatelessWidget {
  JoinPage({super.key});

  final List<Map<String, dynamic>> _posts = [
    {
      'userName': ' Hasan',
      'feeling': 'happy',
      'time': '1hr',
      'text': 'This is my first post!',
      'likesCount': 10,
      'commentsCount': 5,
      'sharesCount': 2,
    },
    {
      'userName': 'Tahsina Sabrin',
      'feeling': 'sad',
      'time': '2hrs',
      'text': 'Just graduated from college!',
      'likesCount': 20,
      'commentsCount': 15,
      'sharesCount': 8,
    },
    {
      'userName': 'lorem',
      'feeling': 'excited',
      'time': '3hrs',
      'text': 'Enjoying the weekend!',
      'taggedUserName': 'Md. Sarikul Islam Ankon',
      'likesCount': 30,
      'commentsCount': 10,
      'sharesCount': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/i.svg',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/appShare.svg',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/fi-rs-menu-burger.svg',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildGroupCard(
                screenWidth: MediaQuery.of(context).size.width,
                title: 'Picnic at Rajshahi office',
                groupType: 'Private Group',
                membersCount: '27 Members',
                memberImages: const [
                  'assets/icons/group.png',
                  'assets/icons/kMask group.png',
                  'assets/icons/SMask group.png',
                  'assets/icons/jahid.png',
                  'assets/icons/AMask group.png',
                  'assets/icons/ab.png',
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/icons/kMask group.png'),
                      ),
                    ),
                  ),
                  // BuildCircularImage(
                  //   imagePath: 'assets/icons/kMask group.png',
                  //   // 'assets/icons/kMask group.png',
                  //   // height: 60,
                  //   // width: 60,
                  //   // screenWidth: screenWidth,
                  // ),
                  // Circular image
                  const SizedBox(width: 16),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                        hintText: 'Write something', // Text input box
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    screenWidth: 200,
                    buttonText: "button",
                    onPressed: () {},
                    svgImagePath: 'assets/icons/contribute.svg',
                  ),
                  CustomButton(
                    screenWidth: 200,
                    buttonText: "button",
                    onPressed: () {},
                    svgImagePath: '',
                  ),
                  CustomButton(
                    screenWidth: 200,
                    buttonText: "button",
                    onPressed: () {},
                    svgImagePath: '',
                  ),
                ],
              ),

              // Dynamic Post Section
              ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return BuildPost(
                    feeling: '',
                    // screenWidth: 200,
                    userName: _posts[index]['userName'],
                    time: _posts[index]['time'],
                    text: _posts[index]['text'],
                    likesCount: _posts[index]['likesCount'],
                    commentsCount: _posts[index]['commentsCount'],
                    sharesCount: _posts[index]['sharesCount'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class BuildCircularImage extends StatelessWidget {
//   const BuildCircularImage({super.key, required this.imagePath});
//   final double height = 60;
//   final double width = 60;
//   final String imagePath;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: AssetImage(imagePath),
//         ),
//       ),
//     );
//   }
// }