import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/area_model.dart';
import '../../../../model/my_response.model.dart';

class AreaTpsViewModel extends CustomBaseViewModel {
  final log = getLogger('AreaTpsViewModel');

  List<KecamatanModel> listKecamatanModel = [];
  int jumlahArea = 0;
  bool status = false;

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    String? idCaleg = await mySharedPrefs.getString('id');
    await getData(idCaleg!);
  }

  getData(String idCaleg) async {
    setBusy(true);

    try {
      var response = await httpService.get('/area/cek_area_caleg/$idCaleg');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      // log.i('myResponseModel: ${myResponseModel.data}');
      KecamatanDetail kecamatanDetail =
          KecamatanDetail.fromJson(myResponseModel.data);
      // log.i('kecamatanDetail: ${kecamatanDetail.kecamatan}');
      listKecamatanModel = kecamatanDetail.kecamatan ?? [];

      jumlahArea = kecamatanDetail.jumlah!;
      // log.i('jumlahArea: $jumlahArea');
      status = true;
    } catch (e) {
      log.e(e.toString());
      status = false;
    } finally {
      setBusy(false);
    }
  }

  cekSuara(KecamatanModel kecamatanModel) async {
    await bottomSheetService.showCustomSheet(
      data: kecamatanModel.kecamatanId,
      barrierDismissible: true,
      isScrollControlled: true,
      title: 'Detail Suara Kecamatan ${kecamatanModel.name}',
      description: 'Kecamatan',
      ignoreSafeArea: false,
      variant: BottomSheetType.detailSuaraBottomSheetView,
    );
  }
}
