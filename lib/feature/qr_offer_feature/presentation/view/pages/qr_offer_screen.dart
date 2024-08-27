import 'dart:io';

import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../generated/assets.dart';

class QrOfferScreen extends StatefulWidget {
  const QrOfferScreen({super.key});

  @override
  State<QrOfferScreen> createState() => _QrOfferScreenState();
}

class _QrOfferScreenState extends State<QrOfferScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final num? campaignId = GoRouterState.of(context).extra! as num?;
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<QrOfferCubit, QrOfferState>(
        listener: (context, state) async {
          if (state is QrOfferTakeLoadingState) {
            EasyLoading.show();
          } else if (state is QrOfferTakeFailState) {
            await EasyLoading.dismiss();
            if (context.mounted) {
              context.pop();
            }
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    state.message,
                    style: AppStyle.style24Regular(context),
                  ),
                  backgroundColor: Colors.white,
                  icon: Image.asset(
                    Assets.imagesClose,
                    width: 100,
                    height: 100,
                  ),
                  titlePadding: const EdgeInsets.all(8),
                ),
              );
            }
          } else if (state is QrOfferTakeSuccessState) {
            EasyLoading.dismiss();
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  state.successMessage,
                  style: AppStyle.style24Regular(context),
                ),
                backgroundColor: Colors.white,
                icon: Image.asset(Assets.imagesSuccessiconpng),
                titlePadding: const EdgeInsets.all(8),
              ),
            );
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController controller) {
                  this.controller = controller;
                  controller.scannedDataStream.listen(
                    (
                      scanData,
                    ) {
                      if (counter == 0) {
                        if (context.mounted) {
                          int id = -1;
                          try {
                             id = int.parse(scanData.code ?? "0");
                          } catch (e) {
                            id = -1;
                          }
                          QrOfferCubit.get(context).takeOffer(
                            campaignId: campaignId,
                            advId: id,
                          );
                        }
                        counter++;
                      }
                    },
                  );
                },
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Scan a code'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
