import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../routings/app_route.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 150,
              color: kcWhiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/branding/logo.png', width: 120,),],
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () => Get.offAllNamed(Routes.adminHome),
          ),
          ListTile(
            leading: Icon(Icons.newspaper_outlined),
            title: Text('News Management'.tr),
            onTap: () => Get.offAllNamed(Routes.listNews),
          ),
          ListTile(
            leading: Icon(Icons.video_camera_back_rounded),
            title: Text('Videos Management'),
            onTap: () => Get.offAllNamed(Routes.listVideo),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Get.offAllNamed(Routes.setting),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // AppSharedPreferences.setUserLoggedInStatus(false);
              Get.offAllNamed(Routes.login);
            }
          ),
        ],
      ),
    );
  }
}

class LeftNavMenuItem extends StatelessWidget {
  const LeftNavMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.input),
      title: Text('welcome'.tr),
      onTap: () => {},
    );
  }
}
