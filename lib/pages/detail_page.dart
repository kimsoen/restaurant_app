import 'package:flutter/material.dart';
import 'package:restaurant_apps/models/restaurantModel.dart';
import 'package:restaurant_apps/widgets/food_items.dart';

class DetailPage extends StatelessWidget {
  final RestaurantElement resto;
  const DetailPage({
    Key? key,
    required this.resto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                resto.pictureId,
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 170,
        margin: const EdgeInsets.only(
          top: 230,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(1.0),
            ],
          ),
        ),
      );
    }

    Widget nameAndAddress() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          260,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resto.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${resto.city}, Indonesia',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              resto.description,
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget foods() {
      List<Foods> foods = resto.menus.foods;
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Makanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children: foods
                    .map(
                      (e) => FoodsAndDrinks(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget drinks() {
      List<Drink> drinks = resto.menus.drinks;
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Minuman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children: drinks
                    .map(
                      (e) => FoodsAndDrinks(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        height: 55,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff138F87),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Kunjungi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameAndAddress(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description(),
                foods(),
                drinks(),
                button(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
