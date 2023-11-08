import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../services/global_var.dart';
import '../../../services/shared_prefs.dart';

class CalegIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('CalegIndexTrackingViewModel');
  final mySharedPrefs = locator<MySharedPrefs>();
  final navigationService = locator<NavigationService>();
  final globalVar = locator<GlobalVar>();
  final snackbarService = locator<SnackbarService>();
  final dialogService = locator<DialogService>();

  final _bottomNavBarList = [
    {
      'name': 'Area\nTPS',
      'icon': Icons.location_on_outlined,
      'header': 'Area TPS',
    },
    {
      'name': 'Hasil\nSuara',
      'icon': Icons.supervised_user_circle_outlined,
      'header': 'Hasil Suara',
    },
    {
      'name': 'Tim \nSurvei',
      'icon': Icons.history_edu_outlined,
      'header': 'History Survei',
    },
    {
      'name': 'Pengaturan',
      'icon': Icons.settings_outlined,
      'header': 'Pengaturan',
    },
  ];

  String header = 'Pengaturan';

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    CalegIndexTrackingViewRoutes.areaTpsView,
    CalegIndexTrackingViewRoutes.logSuaraView,
    CalegIndexTrackingViewRoutes.timSurveiView,
    CalegIndexTrackingViewRoutes.pengaturanCaleg2View,
  ];

  Future<void> init() async {
    String? level = await mySharedPrefs.getString('level');
    log.i('level: $level');
    if (level != 'caleg') {
      mySharedPrefs.clear();
      snackbarService.showSnackbar(
        message: 'Anda tidak memiliki akses',
        title: 'Akses Ditolak',
        duration: const Duration(milliseconds: 2500),
      );
      navigationService.clearStackAndShow(Routes.loginScreenView);
    }
    setIndex(3);
  }

  void handleNavigation(int index) {
    // log.d("handleNavigation: $index");
    // log.d("currentIndex: $currentIndex");

    // if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }

  logout() async {
    dialogService
        .showConfirmationDialog(
      title: 'Konfirmasi',
      description: 'Apakah anda yakin ingin keluar?',
      cancelTitle: 'Batal',
      confirmationTitle: 'Keluar',
    )
        .then((value) async {
      if (value!.confirmed) {
        await mySharedPrefs.clear();
        navigationService.clearStackAndShow(Routes.loginScreenView);
      }
    });
  }
}
