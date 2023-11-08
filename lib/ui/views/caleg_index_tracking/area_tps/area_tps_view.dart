import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './area_tps_view_model.dart';

class AreaTpsView extends StatelessWidget {
  const AreaTpsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AreaTpsViewModel>.reactive(
      viewModelBuilder: () => AreaTpsViewModel(),
      onViewModelReady: (AreaTpsViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AreaTpsViewModel model,
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: warningColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Jumlah Area TPS : ",
                            style: italicTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${model.jumlahArea} TPS',
                              style: boldTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            color: fontColor,
                          ),
                          // SizedBox(width: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: warningColor,
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (model.isBusy)
                              const Center(child: CircularProgressIndicator()),
                            if (!model.isBusy)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      if (model.jumlahArea == 0)
                                        Center(
                                          child: model.status == true
                                              ? const Text(
                                                  'Belum ada area diinput')
                                              : const Text(
                                                  'Gagal mengambil data'),
                                        ),
                                      if (model.jumlahArea > 0)
                                        for (var i = 0;
                                            i < model.jumlahArea;
                                            i++)
                                          Card(
                                            child: ListTile(
                                              leading: Text('${i + 1}'),
                                              title: Text(
                                                  '${model.listAreaModel[i].namaArea}'),
                                              trailing: IconButton(
                                                // trash bin icon
                                                icon: const Icon(
                                                  Icons.list_alt_outlined,
                                                  color: mainColor,
                                                ),
                                                onPressed: () {
                                                  model.cekSuara(
                                                      model.listAreaModel[i]);
                                                },
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
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
