import 'package:flutter_image_play_demo/features/home/data/datasources/hyper_node_remote_data_source.dart';
import 'package:flutter_image_play_demo/features/home/domain/entities/hyper_node_entity.dart';

abstract class HyperNodeRepository {
  Future<HyperNodeEntity> getHyperNode();
}

class HyperNodeRepositoryImpl implements HyperNodeRepository {
  final HyperNodeRemoteDataSource remoteDataSource;

  HyperNodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<HyperNodeEntity> getHyperNode() async {
    return await remoteDataSource.getHyperNode();
  }
}
