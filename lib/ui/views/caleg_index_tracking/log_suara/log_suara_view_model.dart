import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response.model.dart';
import '../../../../model/pemilih_model.dart';

class LogSuaraViewModel extends CustomBaseViewModel {
  final log = getLogger('LogSuaraViewModel');
  int counter = 0;
  List<PemilihModel> listPemilih = [];
  bool status = false;

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    String? idCaleg = await mySharedPrefs.getString('id');
    await getData(idCaleg!);
  }

  getData(String idCaleg) async {
    setBusy(true);

    try {
      var response = await httpService.get('caleg/suara/$idCaleg');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      PemilihDetailModel pemilihDetailModel =
          PemilihDetailModel.fromJson(myResponseModel.data);
      listPemilih = pemilihDetailModel.pemilihModel!;
      counter = listPemilih.length;

      status = true;
    } catch (e) {
      log.e('error: $e');
      status = false;
    } finally {
      setBusy(false);
    }
  }

  showDetailPemilih(PemilihModel listPemilih) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.detailSuaraPemilihBottomSheetView,
      title: 'Detail Suara Pemilih',
      description: 'Detail Suara Pemilih',
      // isScrollControlled: true,
      data: listPemilih,
    );
  }
}
