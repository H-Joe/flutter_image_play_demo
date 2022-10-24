import 'package:flutter_image_play_demo/features/home/presentation/bloc/hyper_node_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/hyper_node_remote_data_source.dart';
import '../../features/home/domain/repositories/hyper_node_repository.dart';
import '../../features/home/domain/usecases/get_hyper_node.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => HyperNodeBloc(hyperNodeUsecase: sl()),
  );

  sl.registerLazySingleton(() => GetHyperNode(sl()));

  sl.registerLazySingleton<HyperNodeRepository>(
    () => HyperNodeRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<HyperNodeRemoteDataSource>(
    () => HyperNodeRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
}
