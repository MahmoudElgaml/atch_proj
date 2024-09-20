import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_style.dart';
import '../manger/delete_account_cubit.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog(
      {super.key, this.deletePerson, required this.contexts});

  final Person? deletePerson;
  final BuildContext contexts;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      title: const Text(
        "Are you sure to Delete Account",
        style: TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          onPressed: () {
            DeleteAccountCubit.get(contexts)
                .deleteAccountForBoth(deletePerson?.id, deletePerson?.role);
          },
          child: Text(
            "yes",
            style: AppStyle.style16Regular(context),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            "no",
            style: AppStyle.style16Regular(context),
          ),
        )
      ],
    );
  }
}
