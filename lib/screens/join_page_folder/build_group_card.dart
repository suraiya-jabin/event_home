import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: memberImages.isNotEmpty
                            ? AssetImage(memberImages[0])
                            : const AssetImage(""),
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
                            style: const TextStyle(
                              fontSize: 12,
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
                            style: const TextStyle(
                              fontSize: 12,
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
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: Stack(
                        children: List.generate(
                          5,
                          (imageIndex) {
                            double leftPosition = imageIndex * 25.0;
                            if (imageIndex < memberImages.length) {
                              return Positioned(
                                left: leftPosition,
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(memberImages[imageIndex]),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
