import 'package:drinks/screens/widgets/card_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/drinks_service.dart';

class AlcoholicScreen extends StatelessWidget {
  const AlcoholicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drinksService = Provider.of<DrinksProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: drinksService.alcoholic
              ? const Text("Alcoholic")
              : const Text("Non Alcoholic"),
        ),
        body: const SafeArea(
          child: CardTable(),
        ));
  }
}
