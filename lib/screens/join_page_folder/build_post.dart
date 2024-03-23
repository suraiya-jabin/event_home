import 'package:flutter/material.dart';

class BuildPost extends StatefulWidget {
  const BuildPost({
    Key? key,
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
  }) : super(key: key);

  final String userName;
  final String feeling;
  final String time;
  final String text;
  final String? profileImagePath;
  final String? postImagePath;
  final String? taggedUserName;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;

  @override
  _BuildPostState createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  int newLikesCount = 0;
  int newCommentsCount = 0;
  int newSharesCount = 0;
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: widget.profileImagePath != null
                        ? AssetImage(widget.profileImagePath ?? '')
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.userName} is with ${widget.taggedUserName ?? ''} ${widget.feeling.isNotEmpty ? 'and feeling ${widget.feeling}' : ''}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.time,
                          style: const TextStyle(fontSize: 16),
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
            if (widget.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(widget.text),
              ),
            if (widget.postImagePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.postImagePath ?? ''),
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changeButton = true;
                              newLikesCount++;
                            });
                          },
                          onSecondaryTap: () {
                            setState(() {
                              changeButton = false;
                              newLikesCount--;
                            });
                          },
                          child: changeButton
                              ? const Icon(Icons.thumb_up)
                              : const Icon(Icons.thumb_up_outlined),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('${widget.likesCount + newLikesCount}'),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newCommentsCount++;
                          });
                        },
                        child: const Icon(Icons.comment),
                      ),
                      const SizedBox(width: 8),
                      Text('${widget.commentsCount + newCommentsCount}'),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newSharesCount++;
                          });
                        },
                        child: const Icon(Icons.share),
                      ),
                      const SizedBox(width: 8),
                      Text('${widget.sharesCount + newSharesCount}'),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Like'),
                  SizedBox(width: 8),
                  Text('Comment'),
                  SizedBox(width: 8),
                  Text('Share'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
