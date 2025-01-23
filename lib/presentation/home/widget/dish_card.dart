import 'package:flutter/material.dart';
import 'package:zartek/domain/models/dishes_model.dart';
import 'package:zartek/gen/assets.gen.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    required this.dish,
  });

  final Dishes? dish;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ListTile(
                title: Text(dish?.name ?? ''),
                subtitle: Text(
                    '${dish?.currency} ${dish?.price}\n${dish?.description}'),
                trailing: Image.network(
                  dish?.imageUrl ?? '',
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Assets.images.placeholder.path,
                      width: 50,
                      height: 50,
                    );
                  },
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Text(
                dish?.customizationsAvailable == true
                    ? "Customizations Available"
                    : "",
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
