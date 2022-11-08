import 'dart:async';

import 'package:flutter/material.dart';

import 'loader.dart';
import 'style.dart';

SizedBox heightSizedBox(double height) {
  return SizedBox(height: height);
}

SizedBox widthSizedBox(double width) {
  return SizedBox(width: width);
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

// Future choseTime(BuildContext context, {int? i}) async {
//   String? hour;
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//     initialEntryMode: TimePickerEntryMode.input,
//     // builder: (BuildContext context, Widget? child) {
//     //   return MediaQuery(
//     //     data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//     //     child: child!,
//     //   );
//     // },
//   );
//   if (picked != null) {
//     hour =
//         "${picked.hour > 12 ? picked.hour - 12 : picked.hour}:${picked.minute} ${picked.period.name}";
//     if (i == 1) {
//       return {'time': hour, 'picked': "${picked.hour}:${picked.minute}"};
//     } else {
//       return hour;
//     }
//   } else {
//     if (i == 1) {
//       return {};
//     } else {
//       return null;
//     }
//   }
// }

navigationRemoveUntil(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

navigationPushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Future navigationPush(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

navigationPop(BuildContext context) {
  Navigator.of(context).pop();
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)));
}

// void closeKeyboard(BuildContext context) {
//   FocusScope.of(context).requestFocus(FocusNode());
// }

// List<TextInputFormatter> digitsInputFormatter({int? size}) {
//   return [
//     FilteringTextInputFormatter.digitsOnly,
//     LengthLimitingTextInputFormatter(size ?? 10),
//   ];
// }

// List<TextInputFormatter> inputLength(int? size) {
//   return [
//     LengthLimitingTextInputFormatter(size),
//   ];
// }

OverlayEntry overlayLoader(context) {
  return OverlayEntry(builder: (context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      // top: 0,
      // left: 0,
      child: Material(
        color: primaryColor.withOpacity(0.50),
        child: const Loader(height: 200),
      ),
    );
  });
}

removeLoader(OverlayEntry loader) {
  Timer(const Duration(milliseconds: 500), () {
    try {
      loader.remove();
      // ignore: empty_catches
    } catch (e) {}
  });
}

// String convertInSlug(String name) {
//   if (name.isNotEmpty) {
//     name = name.toLowerCase();
//     name = name.replaceAll(' ', '-');
//     name = name.replaceAll('--', '-');
//     return name;
//   } else {
//     return '';
//   }
// }

String convertTitleIntoSlug(String name) {
  name = name.toLowerCase();
  name = name.replaceAll("'", '');
  String output = name.replaceAll(RegExp('[^A-Za-z0-9]'), ' ');
  output = output.replaceAll(' ', '-');
  output = output.replaceAll('--', '-');
  output = output.replaceAll('---', '-');
  output = output.replaceAll('----', '-');
  output = output.replaceAll('-----', '-');
  output = output.replaceAll('------', '-');

  return output.trim();
}

// InkWell myRadioButton(
//     {required String value, groupValue, onTap, required String lable}) {
//   return InkWell(
//     onTap: onTap,
//     child: Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             groupValue == value ? Icons.check_circle : Icons.circle_outlined,
//             color: groupValue == value ? greenColor : blueColor,
//             size: 25,
//           ),
//           widthSizedBox(2.0),
//           Flexible(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Text(
//                 lable,
//                 style: normalTs,
//               ),
//             ),
//           ),
//           widthSizedBox(12.0),
//         ],
//       ),
//     ),
//   );
// }
