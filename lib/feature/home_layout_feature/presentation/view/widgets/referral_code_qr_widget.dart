import 'package:atch_proj/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/utils/app_style.dart';

class ReferralCodeQrWidget extends StatelessWidget {
  const ReferralCodeQrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your referral_code :",
          style: AppStyle.style18Regular(context),
        ),
        const Gap(10),
        QrImageView(
          data: Helper.retrievePerson()?.referralCode,
          version: QrVersions.auto,
          size: 150.0,
        ),
      ],
    );
  }
}
