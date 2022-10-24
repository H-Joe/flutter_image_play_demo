import 'package:flutter_image_play_demo/generated/json/base/json_field.dart';
import 'package:flutter_image_play_demo/generated/json/hyper_node_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HyperNodeEntity {
  late List<HyperNodeItem> hyperNodes;

  HyperNodeEntity();

  factory HyperNodeEntity.fromJson(Map<String, dynamic> json) =>
      $HyperNodeEntityFromJson(json);

  Map<String, dynamic> toJson() => $HyperNodeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HyperNodeItem {
  late String imagePath;
  late String publishTime;
  late String publishPlatform;

  HyperNodeItem();

  factory HyperNodeItem.fromJson(Map<String, dynamic> json) =>
      $HyperNodeItemFromJson(json);

  Map<String, dynamic> toJson() => $HyperNodeItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
