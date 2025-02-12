import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/controller/home_controller.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/controller/home_states.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/widgets_state/home_default.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/widgets_state/home_error.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/widgets_state/home_loading.dart';
import 'package:teste_tecnico_guia_de_moteis/core/widgets/app_scaffold.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({
    super.key,
    required this.homeController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => controller.getMotelList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder(
        bloc: controller,
        builder: (_, HomeStates state) {
          switch (state) {
            case HomeDefaultState():
              return HomeDefaultWidget(motelModel: state.data,);
            case HomeLoadingState():
              return const HomeLoadingWidget();
            default:
              return const HomeErrorWidget();
          }
        },
      ),
    );
  }

  HomeController get controller => widget.homeController;
}
