import 'package:flutter/widgets.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_controller.dart';

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
    return const Placeholder();
  }

  HomeController get controller => widget.homeController;
}
