import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/presentation/loading/loading_screen.dart';

import 'firebase_options.dart';
import 'utils/import_utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///Native Splash screen initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Run app
  runApp(
    /// Device preview for all devices
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => (

          /// ProviderScope for state management
          const ProviderScope(observers: [StateLogger()], child: MyApp())),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      // Received changes in available connectivity types!
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        print("🟥🟥✅✅🟥🟥 network : mobile");
        if (Globals.alertKey.currentContext != null) {
          Navigator.pop(Globals.alertKey.currentContext!);
        }

        // Mobile network available.
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        print("🟥🟥✅✅🟥🟥 network : wifi");
        if (Globals.alertKey.currentContext != null) {
          Navigator.pop(Globals.alertKey.currentContext!);
        }

        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        print("🟥🟥✅✅🟥🟥 network : 🟥🟥🟥🟥");
        if (Globals.navigatorKey.currentContext != null) {
          DialogServiceV1().singleButtonDialog(
            backButtonCanDismiss: false,

              barrierDismiss: false,
              keyId: "connectionDialogue",
              titleText: "No internet connection",
              subtitleText:
                  "please check you connection and then retry to proceed",
              buttonText: "Retry",
              onYesPressed: () {
                if (connectivityResult.contains(ConnectivityResult.wifi) ||
                    connectivityResult.contains(ConnectivityResult.mobile)) {
                  Navigator.pop(Globals.navigatorKey.currentContext!);
                }else{
                  DialogServiceV1().showSnackBar(content: "Not connected", color: AppColors.black, textclr: AppColors.white);
                }
              });
        }

        // No available network types
      }
    });
    initialization();
  }

  void initialization() async {
    Timer(const Duration(seconds: 2), () {
      /// Remove splash screen
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),

      /// Navigator key for global navigation
      navigatorKey: Globals.navigatorKey,

      /// Remove debug banner
      debugShowCheckedModeBanner: false,

      /// Device preview builder
      builder: DevicePreview.appBuilder,

      /// App name
      title: AppText.appName,

      /// Use inherited media query
      useInheritedMediaQuery: true,

      /// Theme data
      theme: ThemeData(
        fontFamily: GoogleFonts.jura().fontFamily,
        useMaterial3: true,
      ),

      /// from API login

      home: LoadingScreen(),
    );
  }
}
