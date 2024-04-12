import 'package:flutter/material.dart';

import 'app_color.dart';

class Utility {
  static progressLoadingDialog(BuildContext context, bool status) {
    if (status) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.yellow,
            ),
          );
        },
      );
      // return pr.show();
    } else {
      Navigator.pop(context);
      // return pr.hide();
    }
  }
}
