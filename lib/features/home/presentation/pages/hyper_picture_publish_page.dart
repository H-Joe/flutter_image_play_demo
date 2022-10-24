import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../widgets/load_image.dart';
import '../widget/image_item_widget.dart';

class HyperPicturePublishPage extends StatefulWidget {
  final AssetEntity entity;

  const HyperPicturePublishPage({Key? key, required this.entity})
      : super(key: key);

  @override
  State<HyperPicturePublishPage> createState() =>
      _HyperPicturePublishPageState();
}

class _HyperPicturePublishPageState extends State<HyperPicturePublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const LoadImage(
            'vector',
            width: 9,
            height: 16,
          ),
        ),
        actions: [
          Container(
            child: TextButton(
              onPressed: () {},
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF50FDF6), Color(0xFF38BAFF)],
                  ).createShader(Offset.zero & bounds.size);
                },
                blendMode: BlendMode.srcATop,
                child: const Text(
                  "发布",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(left: 41, right: 41, top: 34),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ImageItemWidget(
                entity: widget.entity,
                option: const ThumbnailOption(size: ThumbnailSize.square(200)),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => HyperPicturePublishPage(entity: entity)));
                },
              ),
            )),
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.only(top: 25, bottom: 49, left: 41, right: 41),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 17);
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('选择了滤镜${index + 1}');
                      },
                      child: Container(
                        width: 48,
                        height: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: LoadImage('fliter1'),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '滤镜${index + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1C1C1C),
                      ),
                    )
                  ],
                );
              },
              itemCount: 2,
            ),
          ),
        )
      ],
    );
  }
}
