import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildGroupCard(
                screenWidth,
                'Picnic at Rajshahi office',
                'Private Group',
                '27 Members',
                [
                  'assets/icons/group.png',
                  'assets/icons/kMask group.png',
                  'assets/icons/SMask group.png',
                  'assets/icons/jahid.png',
                  'assets/icons/AMask group.png',
                  'assets/icons/ab.png',
                ],
              ),
              const SizedBox(height: 20),
              buildPostInputField(screenWidth),
              const SizedBox(
                height: 20,
                width: 20,
              ), // Added SizedBox for spacing
              buildButtonRow(screenWidth),
              // Dynamic Post Section
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return BuildPost(
                    feeling: '',
                    screenWidth: 200,
                    userName: _posts[index]['userName'],
                    time: _posts[index]['time'],
                    text: _posts[index]['text'],
                    likesCount: _posts[index]['likesCount'],
                    commentsCount: _posts[index]['commentsCount'],
                    sharesCount: _posts[index]['sharesCount'],

                    // screenWidth,
                    // _posts[index]['userName'],
                    // _posts[index]['feeling'],
                    // _posts[index]['time'],
                    // _posts[index]['text'],
                    // likesCount: _posts[index]['likesCount'],
                    // commentsCount: _posts[index]['commentsCount'],
                    // sharesCount: _posts[index]['sharesCount'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGroupCard(double screenWidth, String title, String groupType,
      String membersCount, List<String> memberImages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(memberImages[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/Arrow - Right 2.svg'),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Lock.svg'),
                    const SizedBox(width: 8),
                    Text(
                      groupType,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.black38,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      membersCount,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset('assets/icons/arrow.svg'),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 1),
        Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  _buildCircularImage('assets/icons/kMask group.png'),
                  Positioned(
                    left: screenWidth * 0.07,
                    child: _buildCircularImage('assets/icons/SMask group.png'),
                  ),
                  Positioned(
                    left: screenWidth * 0.14,
                    child: _buildCircularImage('assets/icons/jahid.png'),
                  ),
                  Positioned(
                    left: screenWidth * 0.21,
                    child: _buildCircularImage('assets/icons/AMask group.png'),
                  ),
                  Positioned(
                    left: screenWidth * 0.28,
                    child: Stack(
                      children: [
                        _buildCircularImage('assets/icons/ab.png'),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.more_horiz,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text(
                'Invite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              'assets/icons/person_drop.svg',
              height: screenWidth * 0.10,
              width: screenWidth * 0.12,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularImage(String imagePath,
      {double height = 30, double width = 30}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget buildPostInputField(double screenWidth) {
    return Row(
      children: [
        _buildCircularImage(
          'assets/icons/kMask group.png',
          height: 60,
          width: 60,
          // screenWidth: screenWidth,
        ),
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
    );
  }

  Widget buildButtonRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        CustomButton(
          svgImagePath: 'assets/icons/Image 2.svg',
          buttonText: 'Photo',
          onPressed: () {
            //
          },
          screenWidth: screenWidth,
        ),
        CustomButton(
          svgImagePath: 'assets/icons/Budget.svg',
          buttonText: 'Expenditure',
          onPressed: () {
            //
          },
          screenWidth: screenWidth,
        ),
        CustomButton(
          svgImagePath: 'assets/icons/contribute.svg',
          buttonText: 'Contribution',
          onPressed: () {
            //
          },
          screenWidth: screenWidth,
        ),
      ],
    );
  }

  // Widget buildPost(
  //   double screenWidth,
  //   String userName,
  //   String feeling,
  //   String time,
  //   String text, {
  //   String? profileImagePath,
  //   String? postImagePath,
  //   String? taggedUserName,
  //   int likesCount = 0,
  //   int commentsCount = 0,
  //   int sharesCount = 0,
  // }) {
  // return Padding(
  //   padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 3,
  //           spreadRadius: 1,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CircleAvatar(
  //                 radius: 20,
  //                 backgroundImage: profileImagePath != null
  //                     ? AssetImage(profileImagePath)
  //                     : null,
  //               ),
  //               const SizedBox(width: 8),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       '$userName is with ${taggedUserName ?? ''} ${feeling.isNotEmpty ? 'and feeling $feeling' : ''}',
  //                       style: TextStyle(fontSize: screenWidth * 0.04),
  //                     ),
  //                     const SizedBox(height: 4),
  //                     Text(
  //                       time,
  //                       style: TextStyle(fontSize: screenWidth * 0.03),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               PopupMenuButton<String>(
  //                 itemBuilder: (BuildContext context) {
  //                   return {'Edit', 'Delete'}.map((String choice) {
  //                     return PopupMenuItem<String>(
  //                       value: choice,
  //                       child: Text(choice),
  //                     );
  //                   }).toList();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //         if (text.isNotEmpty)
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //             child: Text(text),
  //           ),
  //         if (postImagePath != null)
  //           Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 8.0),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(8),
  //               child: Image.asset(postImagePath),
  //             ),
  //           ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   GestureDetector(
  //                       onTap: () {},
  //                       child: const Icon(Icons.thumb_up_outlined)),
  //                   const SizedBox(width: 8),
  //                   Text('$likesCount'),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   const Icon(Icons.comment),
  //                   const SizedBox(width: 8),
  //                   Text('$commentsCount'),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   const Icon(Icons.share),
  //                   const SizedBox(width: 8),
  //                   Text('$sharesCount'),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
// }

class BuildPost extends StatelessWidget {
  BuildPost({
    super.key,
    required this.screenWidth,
    required this.userName,
    required this.feeling,
    required this.time,
    required this.text,
    this.profileImagePath,
    this.postImagePath,
    this.taggedUserName,
    required this.commentsCount,
    required this.likesCount,
    required this.sharesCount,
  });
  double screenWidth;
  String userName;
  String feeling;
  String time;
  String text;
  String? profileImagePath;
  String? postImagePath;
  String? taggedUserName;
  int likesCount;
  int commentsCount;
  int sharesCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: profileImagePath != null
                        ? AssetImage(profileImagePath ?? '')
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$userName is with ${taggedUserName ?? ''} ${feeling.isNotEmpty ? 'and feeling $feeling' : ''}',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: TextStyle(fontSize: screenWidth * 0.03),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return {'Edit', 'Delete'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
            if (text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(text),
              ),
            if (postImagePath != null)z
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(postImagePath ?? ''),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.thumb_up_outlined)),
                      const SizedBox(width: 8),
                      Text('$likesCount'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.comment),
                      const SizedBox(width: 8),
                      Text('$commentsCount'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.share),
                      const SizedBox(width: 8),
                      Text('$sharesCount'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String svgImagePath;
  final String buttonText;
  final VoidCallback onPressed;
  final double screenWidth;

  const CustomButton({
    super.key,
    required this.svgImagePath,
    required this.buttonText,
    required this.onPressed,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.zero,
        // shadowColor: Colors.black45,
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            colors: [
              Color(0x00f2f3f2),
              Color(0x00f9f9f8),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgImagePath,
                height: screenWidth * 0.05,
                width: screenWidth * 0.1,
              ),
              const SizedBox(width: 8),
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.029,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
