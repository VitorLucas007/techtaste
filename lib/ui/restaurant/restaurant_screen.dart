import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dishe.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/widgets/app_bar.dart';
import 'package:techtaste/ui/dishe/dishe_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/${restaurant.imagePath}', width: 128),
                Text(
                  'Mais Pedidos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: List.generate(restaurant.dishes.length, (index) {
                    Dish dish = restaurant.dishes[index];
                    return Card(
                      color: AppColors.lightBackgroundColor ,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisheScreen(dish: dish),
                                ),
                              );
                            },
                            leading: Image.asset('assets/dishes/default.png'),
                            title: Text(dish.name),
                            subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<BagProvider>().addAllDishes([dish]);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
