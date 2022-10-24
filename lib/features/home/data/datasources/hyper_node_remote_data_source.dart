import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_play_demo/features/home/domain/entities/hyper_node_entity.dart';
import 'package:http/http.dart' as http;

abstract class HyperNodeRemoteDataSource {
  Future<HyperNodeEntity> getHyperNode();
}

class HyperNodeRemoteDataSourceImpl implements HyperNodeRemoteDataSource {
  final http.Client client;

  HyperNodeRemoteDataSourceImpl({required this.client});

  @override
  Future<HyperNodeEntity> getHyperNode() async {
    String jsonString =
        await rootBundle.loadString("assets/data/hyperNodes.json");
    return HyperNodeEntity.fromJson(json.decode(jsonString));
  }
}
