import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildGroupCard extends StatelessWidget {
  final double screenWidth;
  final String title;
  final String groupType;
  final String membersCount;
  final List<String> memberImages;

  const BuildGroupCard({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.groupType,
    required this.membersCount,
    required this.memberImages,
  });

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(memberImages.isNotEmpty
                      ? memberImages[0]
                      : ""), // Added condition to check if memberImages list is not empty
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
            // Expanded(
            //   child: Stack(
            //     children: _buildMemberImages(screenWidth),
            //   ),
            // ),
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

  List<Widget> _buildMemberImages(double screenWidth) {
    List<Widget> widgets = [];
    double leftPosition = 0.0;
    for (String imagePath in memberImages) {
      widgets.add(
        Positioned(
          left: leftPosition,
          child: _buildCircularImage(imagePath),
        ),
      );
      leftPosition += screenWidth * 0.07;
    }
    return widgets;
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
}
