import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../pengaturan_caleg_view.dart';
import './pengaturan_caleg2_view_model.dart';

class PengaturanCaleg2View extends StatelessWidget {
  const PengaturanCaleg2View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengaturanCaleg2ViewModel>.nonReactive(
      viewModelBuilder: () => PengaturanCaleg2ViewModel(),
      onViewModelReady: (PengaturanCaleg2ViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PengaturanCaleg2ViewModel model,
        Widget? child,
      ) {
        return const PengaturanCalegView();
      },
    );
  }
}
