import 'package:flutter/material.dart';
import 'package:libido/model/sex_position.dart';
import 'package:libido/repository/sex_position_repository.dart';

class SexPositionDetail extends StatefulWidget {
  const SexPositionDetail({Key? key}) : super(key: key);

  static const routeName = '/sexPositionDetail';

  @override
  State<SexPositionDetail> createState() => _SexPositionDetailState();
}

class _SexPositionDetailState extends State<SexPositionDetail> {
  final SexPositionRepository _sexPositionRepository = SexPositionRepository();
  late SexPosition _sexPosition;
  late int _sexPositionId;
  bool _fromRandom = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getArguments();
    _loadSexPosition(false);
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sexPosition.name),
        actions: [
          _fromRandom
              ? IconButton(
                  onPressed: () {
                    _loadSexPosition(true);
                  },
                  icon: const Icon(Icons.refresh))
              : Container()
        ],
      ),
      body: SafeArea(child: _buildScrollView(context, _sexPosition)),
    );
  }

  Widget _buildScrollView(BuildContext context, SexPosition sexPosition) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: _buildDetail(context, sexPosition),
          ),
        ),
      ],
    );
  }

  Widget _buildDetail(BuildContext context, SexPosition sexPosition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Hero(
            tag: sexPosition.id,
            transitionOnUserGestures: true,
            child: Image.asset(
              "assets/images/${sexPosition.image}",
              height:
                  MediaQuery.of(context).size.height * 0.6, //60% of screen size
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          sexPosition.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          sexPosition.description ?? "",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  void _getArguments() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    _sexPositionId = arguments["position_id"] as int;
    _fromRandom = arguments["from_random"] as bool;
  }

  void _loadSexPosition(bool isRandom) {
    if (isRandom) {
      _sexPositionId = _sexPositionRepository.getRandomSexPosition();
    }
    _sexPosition = _sexPositionRepository.getSexPosition(_sexPositionId);

    if (isRandom) {
      setState(() {});
    }
  }
}
