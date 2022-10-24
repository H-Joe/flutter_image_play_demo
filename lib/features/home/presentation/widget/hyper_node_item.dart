import 'package:flutter/cupertino.dart';

import '../../../widgets/load_image.dart';

class HyperNodeItem extends StatelessWidget {
  final String imagePath;
  final String publishTime;
  final String publishPlatform;

  const HyperNodeItem({
    Key? key,
    required this.imagePath,
    required this.publishPlatform,
    required this.publishTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: const Color(0xFFE8E8E8),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 25, left: 29, bottom: 14, right: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 158,
                height: 158,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: LoadImage(imagePath),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Text(
                      publishTime,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      publishPlatform,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
