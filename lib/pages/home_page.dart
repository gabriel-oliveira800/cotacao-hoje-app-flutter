import 'package:cotacao/repository/repository_implemention.dart';
import 'package:cotacao/repository/repository_interface.dart';
import 'package:cotacao/controllers/home_controller.dart';
import 'package:cotacao/components/currencies_item.dart';
import 'package:cotacao/components/loading_child.dart';
import 'package:cotacao/components/error_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RepositoryI repository;
  HomeController controller;

  @override
  void initState() {
    super.initState();

    repository = RepositoryImp((Dio()));
    controller = HomeController(repository);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller.getCurrentiesApi();
  }

  Widget homeBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: ListView.builder(
        itemCount: controller.currencies.length,
        itemBuilder: (_, index) {
          var item = controller.currencies[index];
          return Padding(
            child: CurrenciesItem(currencies: item),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
          );
        },
      ),
    );
  }

  Widget statemanagerChild() {
    switch (controller.state) {
      case HomeState.error:
        return ErrorChild(
          callback: controller.getCurrentiesApi,
          error: 'Não possivél carrega os dados.\nPor favor tente novamente.',
        );
      case HomeState.loading:
        return LoadingChild();
      case HomeState.success:
        return homeBody();
      default:
        return homeBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Contação Hoje'),
        leading: Center(
          child: SvgPicture.asset('assets/icons/logo.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () => viewLicenses(context),
            icon: Icon(Icons.help, color: Colors.white),
          ),
          IconButton(
            onPressed: () => controller.getCurrentiesApi(),
            icon: Icon(Icons.refresh_outlined, color: Colors.white),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.homeState,
        builder: (_, __) => statemanagerChild(),
      ),
    );
  }

  void viewLicenses(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationName: 'Cotação',
      applicationVersion: ' 1.0.0',
      applicationIcon: SvgPicture.asset('assets/icons/logo.svg'),
    );
  }
}
