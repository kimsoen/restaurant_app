import 'package:flutter/material.dart';
import 'package:restaurant_apps/models/restaurantModel.dart';
import 'package:restaurant_apps/widgets/content_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cari & Temukan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Restoran ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: ' Favoritmu',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Text(
                'Daftar Restoran',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FutureBuilder<List<RestaurantElement>>(
              future: getDataResto(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<RestaurantElement> resto = snapshot.data!;
                  return Column(
                      children: resto
                          .map(
                            (e) => RestoCard(
                              resto: e,
                            ),
                          )
                          .toList());
                }
                return const Center(
                  child: Text('Tidak ada data'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
