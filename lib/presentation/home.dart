import 'package:clean_architecture_test/domain/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clean arch test'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _latController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        decoration: const InputDecoration(hintText: 'Долгота'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _lngController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        decoration: const InputDecoration(hintText: 'Широта'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  child: const Text(
                    'Получить',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    _getDay();
                  },
                ),
                const SizedBox(height: 16),
                _getDayInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getDayInfo() {
    if (context.read<HomeState>().getDayModel == null) return Container();
    if (context.watch<HomeState>().getIsLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход ${context.read<HomeState>().getDayModel!.sunrise.toLocal()}'),
        Text('Заход ${context.read<HomeState>().getDayModel!.sunset.toLocal()}'),
        Text('Полдень ${context.read<HomeState>().getDayModel!.solarNoon.toLocal()}'),
        Text('Продолжительность ${Duration(seconds: context.read<HomeState>().getDayModel!.dayLength)}',
        ),
      ],
    );
  }

  _getDay() {
    final lat = double.parse(_latController.text);
    final lng = double.parse(_lngController.text);
    context.read<HomeState>().getDay(latitude: lat, longitude: lng);
  }
}
