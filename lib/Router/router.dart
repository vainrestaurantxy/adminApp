import 'dart:async';

import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/View/Auth/LandingPage/landingPage.dart';
import 'package:admin_app/View/Auth/LoginPage/loginPage.dart';
import 'package:admin_app/View/Auth/LogoPage/logoPage.dart';
import 'package:admin_app/View/Auth/LogoPage/logoPreview.dart';
import 'package:admin_app/View/Auth/LogoPage/logouploadPage.dart';
import 'package:admin_app/View/Auth/PasswordReset/emailpage.dart';

import 'package:admin_app/View/Auth/SetUpPage/setUpPage.dart';
import 'package:admin_app/View/Home/AddPage/manageCategory.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../View/Auth/RegisterPage/registerPage.dart';
import '../View/Home/HomePage.dart';

@injectable
class Redirect {
  Redirect(this._db);
  IDatabaseService _db;
  FutureOr<String> redirect(GoRouterState state) async {
    String status = await _db.getStatus();
    print(state.fullPath);
    print(status);
    if (status == "NotLoggedIn") {
      if (state.fullPath == '/' ||
          state.fullPath == '/login' ||
          state.fullPath == '/login/email' ||
          state.fullPath == '/register') {
        return state.fullPath ?? "/";
      } else {
        return "/";
      }
    } else if (status == 'restaurantAdded') {
      if (state.fullPath == '/register/setup/logo' ||
          state.fullPath == '/register/setup/logo/upload' ||
          state.fullPath == '/register/setup/logo/upload/preview') {
        return state.fullPath ?? '/register/setup/logo';
      } else {
        return '/register/setup/logo';
      }
    } else if (status == "Registered") {
      // if (state.fullPath == '/register/setup') {
      //   return state.fullPath ?? "/register/setup";
      // } else {
      return "/register/setup";
      // }
    } else if (status == "LoggedIn") {
      if (state.fullPath == 'home' ||
          state.fullPath == '/home/category' ||
          state.fullPath == '/homestaff') {
        return state.fullPath ?? "/home";
      } else {
        return "/home";
      }
    } else {
      return '/';
    }
  }
}

final GoRouter router = GoRouter(
  redirect: (context, state) {
    return GetIt.instance<Redirect>().redirect(state);
  },
  routes: <RouteBase>[
    GoRoute(
        redirect: (context, state) {
          return GetIt.instance<Redirect>().redirect(state);
        },
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LandingPage();
        },
        routes: [
          GoRoute(
            path: 'homestaff',
            builder: (context, state) => StaffPage(),
          ),
          GoRoute(
              path: 'home',
              builder: (context, state) {
                return HomePage();
              },
              routes: [
                GoRoute(
                  path: 'category',
                  builder: (context, state) => ManageCategory(),
                ),
              ]),
          GoRoute(
              path: 'login',
              builder: (context, state) {
                return LoginPage();
              },
              routes: [
                GoRoute(
                    path: 'email',
                    builder: (context, state) {
                      return EmailPage();
                    }),
              ]),
          GoRoute(
              redirect: (context, state) {
                return GetIt.instance<Redirect>().redirect(state);
              },
              path: 'register',
              builder: (context, state) {
                return RegisterPage();
              },
              routes: [
                GoRoute(
                    redirect: (context, state) {
                      return GetIt.instance<Redirect>().redirect(state);
                    },
                    path: 'setup',
                    builder: (context, state) {
                      return SetUpPage();
                    },
                    routes: [
                      GoRoute(
                          path: 'logo',
                          builder: (context, state) {
                            return LogoPage();
                          },
                          routes: [
                            GoRoute(
                                path: 'upload',
                                builder: ((context, state) => LogoUploadPage()),
                                routes: [
                                  GoRoute(
                                    path: 'preview',
                                    builder: (context, state) => LogoPreview(),
                                  )
                                ])
                          ]),
                    ]),
              ])
        ]),
  ],
);
