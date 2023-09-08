import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:admin_app/ViewModel/AuthViewModel/AuthViewModel.dart';
import 'package:admin_app/firebase_options.dart';
import 'package:admin_app/injection.config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseApp> get firebase =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get store => FirebaseFirestore.instance;

  @injectable
  FirebaseStorage get imageStore => FirebaseStorage.instance;
}
