import '../../../../app/app.dialogs.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response.model.dart';

class PengaturanCalegViewModel extends CustomBaseViewModel {
  final log = getLogger('PengaturanCalegViewModel');

  int timSurverCounter = 0;
  int suaraCounter = 0;
  int areaCounter = 0;
  bool status = false;
  String? nama;

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    String? idCaleg = await mySharedPrefs.getString('id');
    nama = await mySharedPrefs.getString('nama');
    await getData(idCaleg!);
  }

  getData(String idCaleg) async {
    setBusy(true);

    try {
      var response = await httpService.get('caleg/detail/$idCaleg');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      timSurverCounter = myResponseModel.data['jumlah_tim_survei'];
      suaraCounter = myResponseModel.data['jumlah_suara'];
      areaCounter = myResponseModel.data['jumlah_area'];
      status = true;
    } catch (e) {
      log.e(e.toString());
      status = false;
    } finally {
      setBusy(false);
    }
  }

  gantiPassword() async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.gantiPasswordDialogView,
      title: 'Ganti Password',
      mainButtonTitle: 'Simpan',
      barrierDismissible: false,
    );

    if (res!.confirmed) {
      snackbarService.showSnackbar(message: 'Password berhasil diubah');
    }
  }
}
