import 'package:flutter/material.dart';
import 'package:libido/repository/sex_position_repository.dart';
import 'package:libido/ui/sex_position_detail.dart';
import 'package:libido/ui/sex_position_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  static const routeName = '/home';
  static const navigateToPositionList = Key('navigateToPositionList');
  static const navigateToPositionDetail = Key('navigateToPositionDetail');

  final SexPositionRepository _sexPositionRepository = SexPositionRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Libido"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<void>(
            future: _sexPositionRepository.getSexPositions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildContent(context);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _positionListButton(context),
          const SizedBox(height: 16),
          _positionDetailButton(context),
        ],
      ),
    );
  }

  Widget _positionListButton(BuildContext context) {
    return ElevatedButton.icon(
        key: navigateToPositionList,
        icon: const Icon(
          Icons.list,
          size: 30,
        ),
        label: const Text(
          "all position",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: Colors.deepPurpleAccent.shade400),
        onPressed: () {
          Navigator.pushNamed(context, SexPositionList.routeName);
        });
  }

  Widget _positionDetailButton(BuildContext context) {
    return ElevatedButton.icon(
        key: navigateToPositionDetail,
        icon: const Icon(
          Icons.casino,
          size: 30,
        ),
        label: const Text(
          "random position",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: Colors.deepPurpleAccent.shade700),
        onPressed: () {
          int randomPosition = _sexPositionRepository.getRandomSexPosition();
          Navigator.pushNamed(context, SexPositionDetail.routeName,
              arguments: {"position_id": randomPosition, "from_random": true});
        });
  }
}
