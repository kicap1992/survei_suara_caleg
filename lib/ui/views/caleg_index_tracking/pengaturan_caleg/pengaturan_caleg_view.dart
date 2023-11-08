import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/top_container.dart';
import './pengaturan_caleg_view_model.dart';

class PengaturanCalegView extends StatelessWidget {
  const PengaturanCalegView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengaturanCalegViewModel>.reactive(
      viewModelBuilder: () => PengaturanCalegViewModel(),
      onViewModelReady: (PengaturanCalegViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PengaturanCalegViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              // model.log.i('backPressed: ${model.globalVar.backPressed}');
              if (model.globalVar.backPressed == 'exitApp') {
                // model.back();
                model.quitApp(context);
              }
              return false;
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopContainer(
                        title: 'Jumlah Suara',
                        value: '${model.suaraCounter} Suara',
                        icon: Icons.people_alt_outlined,
                        background: warningColor,
                      ),
                      const SizedBox(height: 10),
                      TopContainer(
                        title: 'Area\nTPS',
                        value: '${model.suaraCounter} TPS',
                        icon: Icons.location_on_outlined,
                        background: orangeColor,
                      ),
                      const SizedBox(height: 10),
                      TopContainer(
                        title: 'Jumlah Tim Survei',
                        value: '${model.timSurverCounter} Orang',
                        icon: Icons.co_present_outlined,
                        background: greenColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (model.isBusy)
                        const Center(child: CircularProgressIndicator()),
                      if (!model.isBusy && model.status == true)
                        RichText(
                          text: TextSpan(
                            text: 'Selamat Datang, ',
                            style: regularTextStyle,
                            children: [
                              TextSpan(
                                text: 'Caleg ${model.nama}\n\n',
                                style: boldTextStyle,
                              ),
                              const TextSpan(
                                text: 'Sila tekan menu',
                                style: regularTextStyle,
                              ),
                              TextSpan(
                                text: ' Hasil Suara ',
                                style: boldTextStyle.copyWith(
                                  color: greenColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    'untuk mengetahui jumlah suara.\n\nDan sila tekan menu',
                                style: regularTextStyle,
                              ),
                              TextSpan(
                                text: ' Tim Survei ',
                                style: boldTextStyle.copyWith(
                                  color: greenColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    'untuk mengetahui jumlah tim survei anda.\n\n',
                                style: regularTextStyle,
                              ),
                              const TextSpan(
                                text: 'Dan sila tekan menu',
                                style: regularTextStyle,
                              ),
                              TextSpan(
                                text: ' Area TPS ',
                                style: boldTextStyle.copyWith(
                                  color: greenColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const TextSpan(
                                text: 'untuk mengetahui Area TPS anda.\n\n',
                                style: regularTextStyle,
                              ),
                              const TextSpan(
                                text:
                                    'Jika terjadi kesalahan pada data, silahkan hubungi admin.\n\n',
                                style: regularTextStyle,
                              ),
                              const TextSpan(
                                text: 'Aplikasi dibuat oleh :',
                                style: italicTextStyle,
                              ),
                              TextSpan(
                                text: ' Kicap Karan\n',
                                style: boldTextStyle.copyWith(
                                  color: mainColor,
                                ),
                              ),
                              TextSpan(
                                text: 'http://www.kicap-karan.com\n',
                                style: boldTextStyle.copyWith(
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!model.isBusy && model.status == false)
                        RichText(
                          text: TextSpan(
                            text: 'Selamat Datang, ',
                            style: regularTextStyle,
                            children: [
                              TextSpan(
                                text: '${model.nama}\n',
                                style: boldTextStyle,
                              ),
                              const TextSpan(
                                text: 'Terjadi ',
                                style: regularTextStyle,
                              ),
                              TextSpan(
                                text: 'Error ',
                                style: boldTextStyle.copyWith(
                                  color: redColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const TextSpan(
                                text: 'pada saat mengambil data\n',
                                style: regularTextStyle,
                              ),
                              const TextSpan(
                                text: 'Silahkan coba lagi dengan menekan icon',
                                style: regularTextStyle,
                              ),
                              TextSpan(
                                text: ' Pengaturan\n',
                                style: boldTextStyle.copyWith(
                                  color: greenColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const TextSpan(
                                text: 'di pojok kanan bawah\n',
                                style: regularTextStyle,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // with setting icon
          floatingActionButton: FloatingActionButton(
            backgroundColor: warningColor,
            onPressed: () {
              model.gantiPassword();
            },
            child: const Icon(Icons.settings, color: fontColor),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}
