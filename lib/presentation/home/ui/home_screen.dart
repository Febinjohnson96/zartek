import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zartek/core/routes/route_name.dart';
import 'package:zartek/presentation/home/bloc/home_bloc.dart';
import 'package:zartek/presentation/home/widget/dish_card.dart';
import 'package:zartek/presentation/home/widget/home_drawer.dart';
import 'package:zartek/presentation/home/widget/title_slider.dart';
import 'package:zartek/presentation/widgets/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0; // Declare at the class level

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: _scaffoldKey,
      appDrawer: AppDrawer(
        logoutAction: () => context.read<HomeBloc>().add(HomeLogoutEvent()),
      ),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLogout) {
            context.go(RouteName.auth);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
                if (state is HomeLoading) ...[CircularProgressIndicator()],
                if (state is HomeLoaded) ...[
                  Expanded(
                    flex: 1,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: TitleSlider(
                            isselected: selectedIndex == index,
                            title: state.categories[index].name ?? '',
                          ),
                        );
                      },
                      itemCount: state.categories.length,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      itemCount: state.categories[selectedIndex].dishes?.length,
                      itemBuilder: (context, index) {
                        final dish =
                            state.categories[selectedIndex].dishes?[index];
                        return DishCard(dish: dish);
                      },
                    ),
                  )
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
