import 'package:clean_architecture_test/domain/state/home_state.dart';
import 'package:clean_architecture_test/internal/dependencies/repository_module.dart';
import 'package:clean_architecture_test/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeState(RepositoryModule.dayRepository())),
      ],
      child: MaterialApp(
        title: 'Clean arch test',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Home(),
      ),
    );
  }
}
