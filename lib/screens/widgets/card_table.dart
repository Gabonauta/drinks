import 'dart:ui';

import 'package:drinks/Services/drinks_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinksService = Provider.of<DrinksProvider>(context);

    return drinksService.alcoholic
        ? ListView.builder(
            itemBuilder: (context, index) {
              return _SigleCard(
                  icon: drinksService.drinks[index].strDrinkThumb,
                  color: Colors.orange,
                  text: drinksService.drinks[index].strDrink);
            },
            itemCount: drinksService.drinks.length,
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return _SigleCard(
                  icon: drinksService.drinksNonAlcoholic[index].strDrinkThumb,
                  color: Colors.white,
                  text: drinksService.drinksNonAlcoholic[index].strDrink);
            },
            itemCount: drinksService.drinks.length,
          );
  }
}

class _SigleCard extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;

  const _SigleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundCard(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        CircleAvatar(
            backgroundColor: color,
            radius: 55,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: NetworkImage(icon),
                ),
              ),
            )),
        const Spacer(),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        ),
        const Spacer(),
      ],
    ));
  }
}

class _BackgroundCard extends StatelessWidget {
  final Widget widget;

  const _BackgroundCard({Key? key, required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: widget,
          ),
        ),
      ),
    );
  }
}
