import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_play_demo/features/home/presentation/bloc/hyper_node_bloc.dart';
import 'package:flutter_image_play_demo/features/home/presentation/pages/hyper_choice_pictures_page.dart';
import '../../../../core/injection_container/injection_container.dart';
import '../widget/floating_button.dart';
import '../widget/hyper_node_item.dart';
import '../widget/my_app_bar.dart';

class HyperHomePage extends StatefulWidget {
  const HyperHomePage({Key? key}) : super(key: key);

  @override
  State<HyperHomePage> createState() => _HyperHomePageState();
}

class _HyperHomePageState extends State<HyperHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _getData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    context.read<HyperNodeBloc>().add(GetHyperNodes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HyperNodeBloc>(
        create: (context) => sl<HyperNodeBloc>(),
        child: Scaffold(
          body: buildBody(context),
        ));
  }

  Widget buildBody(BuildContext context) {
    return Builder(
      builder: (context) => RefreshIndicator(
        onRefresh: () async => _getData(context),
        child: Stack(
          children: [
            Scrollbar(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: MyAppBar(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 14,
                    ),
                  ),
                  _buildList(),
                ],
              ),
            ),
            Positioned(
              right: 42,
              bottom: 74,
              child: FloatingButton(
                onTap: () {
                  print('push to HyperChoicePicturesPage');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HyperChoicePicturesPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return BlocBuilder<HyperNodeBloc, HyperNodeState>(
        builder: (context, state) {
      if (state is Loading) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is Loaded) {
        return SliverFixedExtentList(
          itemExtent: 223.0,
          delegate: _mySliverChildBuilderDelegate(state),
        );
      }
      return SliverToBoxAdapter(
        child: Container(),
      );
    });
  }

  _mySliverChildBuilderDelegate(Loaded state) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return HyperNodeItem(
          imagePath: state.hyperNodeEntity.hyperNodes[index].imagePath,
          publishTime: state.hyperNodeEntity.hyperNodes[index].publishTime,
          publishPlatform:
              state.hyperNodeEntity.hyperNodes[index].publishPlatform,
        );
      },
      childCount: state.hyperNodeEntity.hyperNodes.length,
    );
  }
}
