import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.imageUrl, this.logoutAction});
  final String? imageUrl;
  final VoidCallback? logoutAction;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.green,
              child: Image.network(
                  'https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
            IconButton(
                onPressed: () => logoutAction?.call(),
                icon: Row(
                  spacing: 10,
                  children: [Icon(Icons.logout), Text('Logout')],
                ))
          ],
        ),
      ),
    );
  }
}
