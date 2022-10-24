import 'package:flutter_image_play_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_image_play_demo/features/home/domain/entities/hyper_node_entity.dart';

HyperNodeEntity $HyperNodeEntityFromJson(Map<String, dynamic> json) {
  final HyperNodeEntity hyperNodeEntity = HyperNodeEntity();
  final List<HyperNodeItem>? hyperNodes =
      jsonConvert.convertListNotNull<HyperNodeItem>(json['hyperNodes']);
  if (hyperNodes != null) {
    hyperNodeEntity.hyperNodes = hyperNodes;
  }
  return hyperNodeEntity;
}

Map<String, dynamic> $HyperNodeEntityToJson(HyperNodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hyperNodes'] = entity.hyperNodes.map((v) => v.toJson()).toList();
  return data;
}

HyperNodeItem $HyperNodeItemFromJson(Map<String, dynamic> json) {
  final HyperNodeItem hyperNodeItem = HyperNodeItem();
  final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
  if (imagePath != null) {
    hyperNodeItem.imagePath = imagePath;
  }
  final String? publishTime = jsonConvert.convert<String>(json['publishTime']);
  if (publishTime != null) {
    hyperNodeItem.publishTime = publishTime;
  }
  final String? publishPlatform =
      jsonConvert.convert<String>(json['publishPlatform']);
  if (publishPlatform != null) {
    hyperNodeItem.publishPlatform = publishPlatform;
  }
  return hyperNodeItem;
}

Map<String, dynamic> $HyperNodeItemToJson(HyperNodeItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['imagePath'] = entity.imagePath;
  data['publishTime'] = entity.publishTime;
  data['publishPlatform'] = entity.publishPlatform;
  return data;
}
