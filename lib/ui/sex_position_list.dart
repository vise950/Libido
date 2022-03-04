import 'package:flutter/material.dart';
import 'package:libido/model/sex_position.dart';
import 'package:libido/repository/sex_position_repository.dart';
import 'package:libido/ui/sex_position_detail.dart';

class SexPositionList extends StatelessWidget {
  SexPositionList({Key? key}) : super(key: key);

  static const routeName = '/sexPositionList';

  final SexPositionRepository _sexPositionRepository = SexPositionRepository();

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Positions"),
      ),
      body: FutureBuilder<List<SexPosition>>(
        future: _sexPositionRepository.getSexPositions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot.requireData, context);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildList(List<SexPosition> sexPositions, BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _buildListItem(sexPositions[index], context);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: sexPositions.length);
  }

  Widget _buildListItem(SexPosition sexPosition, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SexPositionDetail.routeName,
            arguments: {"position_id": sexPosition.id, "from_random": false});
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Hero(
                tag: sexPosition.id,
                transitionOnUserGestures: true,
                child: Image.asset(
                  "assets/images/${sexPosition.image}",
                  height: 100,
                  width: 130,
                ),
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sexPosition.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      sexPosition.description ?? "",
                      style: const TextStyle(fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
