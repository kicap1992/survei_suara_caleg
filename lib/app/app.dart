import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/global_var.dart';
import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/other_function.dart';

import '../services/shared_prefs.dart';
import '../ui/views/caleg_index_tracking/area_tps/area_tps_view.dart';
import '../ui/views/caleg_index_tracking/caleg_index_tracking_view.dart';
import '../ui/views/caleg_index_tracking/log_suara/log_suara_view.dart';
import '../ui/views/caleg_index_tracking/pengaturan_caleg/ganti_password_dialog/ganti_password_dialog_view.dart';
import '../ui/views/caleg_index_tracking/pengaturan_caleg/pengaturan_caleg2/pengaturan_caleg2_view.dart';
import '../ui/views/caleg_index_tracking/pengaturan_caleg/pengaturan_caleg_view.dart';
import '../ui/views/caleg_index_tracking/tim_survei/tim_survei_view.dart';
import '../ui/views/detail_suara_bottom_sheet/detail_suara_bottom_sheet_view.dart';
import '../ui/views/detail_suara_pemilih_bottom_sheet/detail_suara_pemilih_bottom_sheet_view.dart';
import '../ui/views/login_screen/login_screen_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: CalegIndexTrackingView,
      children: [
        MaterialRoute(page: PengaturanCalegView, initial: true),
        MaterialRoute(page: PengaturanCaleg2View),
        MaterialRoute(page: LogSuaraView),
        MaterialRoute(page: TimSurveiView),
        MaterialRoute(page: AreaTpsView)
      ],
    ),
  ],
  dialogs: [
    StackedDialog(classType: GantiPasswordDialogView),
    // StackedDialog(classType: TambahDetailTimSurveiView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    // this below is mine
    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: GlobalVar),
    LazySingleton(classType: MyFunction),
    LazySingleton(classType: MySharedPrefs)
  ],
  logger: StackedLogger(),
  bottomsheets: [
    StackedBottomsheet(classType: DetailSuaraBottomSheetView),
    StackedBottomsheet(classType: DetailSuaraPemilihBottomSheetView)
  ],
)
class App {}
