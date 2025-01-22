import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zartek/core/routes/route_name.dart';
import 'package:zartek/presentation/home/bloc/home_bloc.dart';
import 'package:zartek/presentation/home/widget/home_drawer.dart';
import 'package:zartek/presentation/widgets/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: Icon(Icons.menu))
              ],
            )
          ],
        ),
      ),
    );
  }
}
