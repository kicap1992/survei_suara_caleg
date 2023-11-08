import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response.model.dart';
import '../../../../model/tim_survei_model.dart';

class TimSurveiViewModel extends CustomBaseViewModel {
  final log = getLogger('TimSurveiViewModel');

  // variabel
  List<TimSurveiModel> listTimSurveiModel = [];
  int jumlahTimSurvei = 0;
  bool status = false;

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    String? idCaleg = await mySharedPrefs.getString('id');
    // log.i('idCaleg: $idCaleg');
    await getData(idCaleg!);
  }

  getData(String idCaleg) async {
    setBusy(true);
    // easyLoading.showLoading();
    // globalVar.backPressed = 'cantBack';
    try {
      var response = await httpService.get('survei/caleg/$idCaleg');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      // log.i('myResponseModel: ${myResponseModel.data}');
      TimSurveiListModel timSurveiListModel =
          TimSurveiListModel.fromJson(myResponseModel.data);
      // log.i('timSurveiListModel: ${timSurveiListModel.survei}');
      listTimSurveiModel = timSurveiListModel.survei ?? [];
      jumlahTimSurvei = timSurveiListModel.jumlah!;
      // log.i('listTimSurveiModel: $listTimSurveiModel');
      // log.i('jumlahTimSurvei: $jumlahTimSurvei');
      status = true;
    } catch (e) {
      log.e(e.toString());
      status = false;
    } finally {
      setBusy(false);
      // globalVar.backPressed = 'exitApp';
      // easyLoading.dismissLoading();
    }
  }

  checkSuara(TimSurveiModel timSurveiModel) async {
    await bottomSheetService.showCustomSheet(
      data: timSurveiModel.nik,
      barrierDismissible: true,
      isScrollControlled: true,
      title: 'Detail Suara Tim Survei ${timSurveiModel.nama}',
      description: 'Tim Survei',
      ignoreSafeArea: false,
      variant: BottomSheetType.detailSuaraBottomSheetView,
    );
  }
}
