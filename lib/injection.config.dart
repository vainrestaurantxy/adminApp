// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart' as _i9;
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart' as _i7;
import 'package:admin_app/injection.dart' as _i17;
import 'package:admin_app/Router/router.dart' as _i12;
import 'package:admin_app/ViewModel/AuthViewModel/AuthViewModel.dart' as _i15;
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart' as _i13;
import 'package:admin_app/ViewModel/HomeViewModel/AddPageViewModel.dart'
    as _i14;
import 'package:admin_app/ViewModel/HomeViewModel/homeViewModel.dart' as _i16;
import 'package:admin_app/ViewModel/HomeViewModel/menuPageViewModel.dart'
    as _i8;
import 'package:admin_app/ViewModel/HomeViewModel/orderViewModel.dart' as _i10;
import 'package:admin_app/ViewModel/HomeViewModel/profilePage.dart' as _i11;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => appModule.firebase,
      preResolve: true,
    );
    gh.factory<_i4.FirebaseAuth>(() => appModule.auth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.store);
    gh.factory<_i6.FirebaseStorage>(() => appModule.imageStore);
    gh.factory<_i7.IFirebaseService>(
        () => _i7.FirebaseService(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i8.MenuPageViewModel>(() => _i8.MenuPageViewModel());
    gh.factory<_i9.IDatabaseService>(() => _i9.DatabaseService(
          gh<_i5.FirebaseFirestore>(),
          gh<_i6.FirebaseStorage>(),
          gh<_i7.IFirebaseService>(),
        ));
    gh.lazySingleton<_i10.OrderViewModel>(
        () => _i10.OrderViewModel(gh<_i9.IDatabaseService>()));
    gh.lazySingleton<_i11.ProfileViewModel>(() => _i11.ProfileViewModel(
          gh<_i7.IFirebaseService>(),
          gh<_i9.IDatabaseService>(),
        ));
    gh.factory<_i12.Redirect>(() => _i12.Redirect(gh<_i9.IDatabaseService>()));
    gh.lazySingleton<_i13.SetupViewModel>(() => _i13.SetupViewModel(
          gh<_i9.IDatabaseService>(),
          gh<_i7.IFirebaseService>(),
        ));
    gh.lazySingleton<_i14.AddViewModel>(() => _i14.AddViewModel(
          gh<_i9.IDatabaseService>(),
          gh<_i7.IFirebaseService>(),
        ));
    gh.lazySingleton<_i15.AuthViewModel>(() => _i15.AuthViewModel(
          gh<_i7.IFirebaseService>(),
          gh<_i9.IDatabaseService>(),
        ));
    gh.lazySingleton<_i16.HomeViewModel>(() => _i16.HomeViewModel(
          gh<_i9.IDatabaseService>(),
          gh<_i7.IFirebaseService>(),
        ));
    return this;
  }
}

class _$AppModule extends _i17.AppModule {}
