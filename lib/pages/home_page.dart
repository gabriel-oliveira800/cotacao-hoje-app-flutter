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
    return ListView.builder(
      itemBuilder: (_, index) {
        var item = controller.currencies[index];
        return CurrenciesItem(currencies: item);
      },
    );
  }

  Widget statemanagerChild() {
    switch (controller.state) {
      case HomeState.error:
        return ErrorChild(
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
        ],
      ),
      body: statemanagerChild(),
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
