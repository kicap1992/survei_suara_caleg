import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/area_model.dart';
import '../../../../model/my_response.model.dart';

class AreaTpsViewModel extends CustomBaseViewModel {
  final log = getLogger('AreaTpsViewModel');

  List<AreaModel> listAreaModel = [];
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
      AreaListModel areaListModel =
          AreaListModel.fromJson(myResponseModel.data);
      listAreaModel = areaListModel.area ?? [];
      log.i('listAreaModel: $listAreaModel');
      jumlahArea = listAreaModel.length;
      log.i('jumlahArea: $jumlahArea');
      status = true;
    } catch (e) {
      log.e(e.toString());
      status = false;
    } finally {
      setBusy(false);
    }
  }

  cekSuara(AreaModel areaModel) async {
    await bottomSheetService.showCustomSheet(
      data: areaModel.idArea,
      barrierDismissible: true,
      isScrollControlled: true,
      title: 'Detail Suara Area ${areaModel.namaArea}',
      description: 'Tim Survei',
      ignoreSafeArea: false,
      variant: BottomSheetType.detailSuaraBottomSheetView,
    );
  }
}
