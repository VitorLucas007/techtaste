import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dishe.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/widgets/app_bar.dart';

class DisheScreen extends StatefulWidget {
  final Dish dish;
  const DisheScreen({super.key, required this.dish});

  @override
  State<DisheScreen> createState() => _DisheScreenState();
}

class _DisheScreenState extends State<DisheScreen> {
  int selectedQuantity = 0;
  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    final dish = widget.dish;
    return Scaffold(
      appBar: getAppBar(context: context, title: widget.dish.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/dishes/default.png', height: 312),
              Text(
                widget.dish.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                'R\$ ${widget.dish.price.toString()}',
                style: TextStyle(fontSize: 22),
              ),
              Text(widget.dish.description),
              Center(
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      radius: 20,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedQuantity++;
                          });
                        },
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      selectedQuantity.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      radius: 20,
                      child: TextButton(
                        onPressed: () {
                          if (selectedQuantity > 0) {
                            setState(() {
                              selectedQuantity--;
                            });
                          }
                        },
                        child: Icon(Icons.arrow_downward, color: Colors.black,),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedQuantity > 0) {
                        bagProvider.addAllDishes(
                          List.filled(selectedQuantity, dish),
                        );
                        setState(() {
                          selectedQuantity = 0;
                        });
                      }
                    },
                    child: Text('Adicionar a sacola'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
