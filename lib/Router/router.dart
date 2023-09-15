
import 'package:admin_app/View/Auth/LandingPage/landingPage.dart';
import 'package:admin_app/View/Auth/LoginPage/loginPage.dart';
import 'package:admin_app/View/Auth/LogoPage/logoPage.dart';
import 'package:admin_app/View/Auth/LogoPage/logoPreview.dart';
import 'package:admin_app/View/Auth/LogoPage/logouploadPage.dart';
import 'package:admin_app/View/Auth/PasswordReset/emailpage.dart';

import 'package:admin_app/View/Auth/SetUpPage/setUpPage.dart';
import 'package:admin_app/View/Home/AddPage/manageCategory.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../View/Auth/RegisterPage/registerPage.dart';
import '../View/Home/HomePage.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LandingPage();
        },
        routes: [
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
              path: 'register',
              builder: (context, state) {
                return RegisterPage();
              },
              routes: [
                GoRoute(
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
