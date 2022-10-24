import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_play_demo/features/home/presentation/pages/hyper_picture_publish_page.dart';
import 'package:flutter_image_play_demo/features/widgets/load_image.dart';
import 'package:photo_manager/photo_manager.dart';

import '../widget/image_item_widget.dart';

class HyperChoicePicturesPage extends StatefulWidget {
  const HyperChoicePicturesPage({Key? key}) : super(key: key);

  @override
  State<HyperChoicePicturesPage> createState() =>
      _HyperChoicePicturesPageState();
}

class _HyperChoicePicturesPageState extends State<HyperChoicePicturesPage> {
  /// Customize your own filter options.
  final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
    imageOption: const FilterOption(
      sizeConstraint: SizeConstraint(ignoreSize: true),
    ),
  );

  AssetPathEntity? _path;
  List<AssetEntity>? _entities;
  int _totalEntitiesCount = 0;
  final int _sizePerPage = 50;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _requestAssets());
  }

  Future<void> _requestAssets() async {
    // Request permissions.
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!mounted) {
      return;
    }
    // Further requests can be only proceed with authorized or limited.
    if (!ps.hasAccess) {
      return;
    }
    // Obtain assets using the path entity.
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      filterOption: _filterOptionGroup,
    );
    if (!mounted) {
      return;
    }
    // Return if not paths found.
    if (paths.isEmpty) {
      return;
    }
    setState(() {
      _path = paths.first;
    });
    _totalEntitiesCount = await _path!.assetCountAsync;
    final List<AssetEntity> entities = await _path!.getAssetListPaged(
      page: 0,
      size: _sizePerPage,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _entities = entities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '选择照片',
          style: TextStyle(fontSize: 16, color: Color(0xD9000000)),
        ),
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
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_entities?.isNotEmpty != true) {
      return const Center(child: Text('No assets found on this device.'));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
          crossAxisSpacing: 6,
          mainAxisSpacing: 6),
      itemCount: _entities!.length,
      itemBuilder: (context, index) {
        final AssetEntity entity = _entities![index];
        return ImageItemWidget(
          key: ValueKey<int>(index),
          entity: entity,
          option: const ThumbnailOption(size: ThumbnailSize.square(200)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HyperPicturePublishPage(entity: entity)));
          },
        );
      },
    );
  }
}
