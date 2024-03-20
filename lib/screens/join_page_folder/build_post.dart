import 'package:flutter/material.dart';

class BuildPost extends StatelessWidget {
  const BuildPost({
    super.key,
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
  final String userName;
  final String feeling;
  final String time;
  final String text;
  final String? profileImagePath;
  final String? postImagePath;
  final String? taggedUserName;
  final int likesCount;
  final int commentsCount;
  // ignore: prefer_typing_uninitialized_variables
  final sharesCount;

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
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: TextStyle(fontSize: 16),
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
            if (postImagePath != null)
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
