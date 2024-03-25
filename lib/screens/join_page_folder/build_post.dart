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
              color: Color.fromARGB(255, 228, 228, 228),
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
              padding: const EdgeInsets.all(4.0),
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
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.thumb_up_alt_rounded,
                        color: Color.fromARGB(255, 31, 130, 216),
                      ),
                      Text('${widget.likesCount + newLikesCount}'),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Comment',
                    textAlign: TextAlign.end,
                  ),
                  //SizedBox(width: 2),
                  //Icon(Icons.thumb_up),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 211, 211, 211)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Material(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              changeButton = true;
                              newLikesCount++;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              changeButton = true;
                              newLikesCount--;
                            });
                          },
                          child: changeButton
                              ? const Icon(Icons.thumb_up)
                              : const Icon(Icons.thumb_up_outlined),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _displayBottomSheet(context);

                          //newCommentsCount++;
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
                            //newSharesCount++;
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
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Write a comment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      maxLines: 3,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Write your comment here...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add your comment submission logic here
                            Navigator.pop(context);
                          },
                          child: const Text('Post'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
