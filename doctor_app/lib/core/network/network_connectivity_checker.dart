import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:doctor_app/core/services/extension/dimen.dart';

import '../../presentation/component/components.dart';
import '../../presentation/component/constants/constant.dart';


networkConnectivityChecker({required Widget child}) {
  return OfflineBuilder(
    connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
      bool connected = connectivity != ConnectivityResult.none;
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            child,
            if (!connected)
              Positioned(
                height: MediaQuery.of(context).padding.top * 2.5,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: connected
                        ? const Color(0xFF00EE44)
                        : const Color(0xFFEE4400),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18.r),
                      bottomLeft: Radius.circular(18.r),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: CustomText(
                    text: connected ? "connected" : "No Connection",
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.white,
                            ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
    child: Scaffold(
      body: child,
    ),
  );
}

/*
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  Future<bool> get hasConnection async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }
}
*/
