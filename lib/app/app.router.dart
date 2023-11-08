// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/area_tps/area_tps_view.dart'
    as _i10;
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/caleg_index_tracking_view.dart'
    as _i4;
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/log_suara/log_suara_view.dart'
    as _i8;
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/pengaturan_caleg/pengaturan_caleg2/pengaturan_caleg2_view.dart'
    as _i7;
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/pengaturan_caleg/pengaturan_caleg_view.dart'
    as _i6;
import 'package:cek_suara_caleg/ui/views/caleg_index_tracking/tim_survei/tim_survei_view.dart'
    as _i9;
import 'package:cek_suara_caleg/ui/views/login_screen/login_screen_view.dart'
    as _i3;
import 'package:cek_suara_caleg/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const calegIndexTrackingView = '/caleg-index-tracking-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    calegIndexTrackingView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginScreenView,
      page: _i3.LoginScreenView,
    ),
    _i1.RouteDef(
      Routes.calegIndexTrackingView,
      page: _i4.CalegIndexTrackingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
      );
    },
    _i4.CalegIndexTrackingView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CalegIndexTrackingView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CalegIndexTrackingViewRoutes {
  static const pengaturanCalegView = '';

  static const pengaturanCaleg2View = 'pengaturan-caleg2-view';

  static const logSuaraView = 'log-suara-view';

  static const timSurveiView = 'tim-survei-view';

  static const areaTpsView = 'area-tps-view';

  static const all = <String>{
    pengaturanCalegView,
    pengaturanCaleg2View,
    logSuaraView,
    timSurveiView,
    areaTpsView,
  };
}

class CalegIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      CalegIndexTrackingViewRoutes.pengaturanCalegView,
      page: _i6.PengaturanCalegView,
    ),
    _i1.RouteDef(
      CalegIndexTrackingViewRoutes.pengaturanCaleg2View,
      page: _i7.PengaturanCaleg2View,
    ),
    _i1.RouteDef(
      CalegIndexTrackingViewRoutes.logSuaraView,
      page: _i8.LogSuaraView,
    ),
    _i1.RouteDef(
      CalegIndexTrackingViewRoutes.timSurveiView,
      page: _i9.TimSurveiView,
    ),
    _i1.RouteDef(
      CalegIndexTrackingViewRoutes.areaTpsView,
      page: _i10.AreaTpsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i6.PengaturanCalegView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PengaturanCalegView(),
        settings: data,
      );
    },
    _i7.PengaturanCaleg2View: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.PengaturanCaleg2View(),
        settings: data,
      );
    },
    _i8.LogSuaraView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LogSuaraView(),
        settings: data,
      );
    },
    _i9.TimSurveiView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.TimSurveiView(),
        settings: data,
      );
    },
    _i10.AreaTpsView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AreaTpsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCalegIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.calegIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengaturanCalegViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(CalegIndexTrackingViewRoutes.pengaturanCalegView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengaturanCaleg2ViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        CalegIndexTrackingViewRoutes.pengaturanCaleg2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedLogSuaraViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(CalegIndexTrackingViewRoutes.logSuaraView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedTimSurveiViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(CalegIndexTrackingViewRoutes.timSurveiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAreaTpsViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(CalegIndexTrackingViewRoutes.areaTpsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCalegIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.calegIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengaturanCalegViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        CalegIndexTrackingViewRoutes.pengaturanCalegView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengaturanCaleg2ViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        CalegIndexTrackingViewRoutes.pengaturanCaleg2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedLogSuaraViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(CalegIndexTrackingViewRoutes.logSuaraView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedTimSurveiViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(CalegIndexTrackingViewRoutes.timSurveiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedAreaTpsViewInCalegIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(CalegIndexTrackingViewRoutes.areaTpsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
