import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            _createHeader(),
            _navItems(Icons.document_scanner, "Documents"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.payment, "Payments"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.document_scanner, "Tax"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.document_scanner, "About"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.info_outlined, "Edit Info"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.notifications_outlined, "Notifications"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.settings_outlined, "App Setting"),
            const Divider(
              thickness: 1,
            ),
            _navItems(Icons.logout_outlined, "Log out"),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 70.0,
                height: 70.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  foregroundImage: AssetImage("ImagePaths.google"),
                  radius: 30,
                )).px(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    "User Name".text.black.semiBold.make(),
                    InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          height: 25,
                          width: 30,
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 16,
                          ),
                        )),
                  ],
                ),
                "No vehicle Selected".text.color(Colors.grey).make(),
              ],
            ).py(20)
          ],
        ).py(30),
      ),
    );
  }

  Widget _navItems(IconData icon, String title) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.blueLight),
          "${title}".text.black.size(14).make().px(10),
        ],
      ),
    );
  }
}
