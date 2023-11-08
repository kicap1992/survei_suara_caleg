import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/top_container.dart';
import './tim_survei_view_model.dart';

class TimSurveiView extends StatelessWidget {
  const TimSurveiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimSurveiViewModel>.reactive(
      viewModelBuilder: () => TimSurveiViewModel(),
      onViewModelReady: (TimSurveiViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TimSurveiViewModel model,
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TopContainer(
                      title: 'Tim\nSurvei',
                      value: '${model.jumlahTimSurvei} Orang',
                      icon: Icons.people_alt_outlined,
                      background: orangeColor,
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Container(
                        alignment: model.isBusy
                            ? Alignment.center
                            : (model.listTimSurveiModel.isNotEmpty
                                ? null
                                : Alignment.center),
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: warningColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (model.isBusy)
                                const Center(
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    color: mainColor,
                                  ),
                                ),
                              if (!model.isBusy &&
                                  model.listTimSurveiModel.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // create 10 list of survei person using card
                                    for (int i = 0;
                                        i < model.jumlahTimSurvei;
                                        i++)
                                      Card(
                                        child: ListTile(
                                            leading: Text('${i + 1}'),
                                            title: Text(
                                              model.listTimSurveiModel[i].nama!,
                                            ),
                                            subtitle: Text(
                                              model.listTimSurveiModel[i].nik!,
                                              style: italicTextStyle,
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                model.checkSuara(model
                                                    .listTimSurveiModel[i]);
                                              },
                                              icon: const Icon(
                                                Icons.list_alt_outlined,
                                                color: mainColor,
                                              ),
                                            )),
                                      ),
                                  ],
                                ),

                              // if listTimSurveiModel is empty
                              if (!model.isBusy &&
                                  model.listTimSurveiModel.isEmpty)
                                Center(
                                  child: Text(
                                    model.status == true
                                        ? 'Data Tim Survei Kosong\n'
                                            'Hubungi Admin Untuk\nTambahkan Tim Survei Baru'
                                        : 'Gagal Mengambil Data Tim Survei',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
