// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HideShowContent extends StatelessWidget {
//   HideShowContent({super.key});
//
//   var _reactive = Get.put(NonReactiveController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('RxBool')),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () => _reactive.changeBool(),
//               child: Text('show content'),
//             ),
//             SizedBox(height: 20),
//
//             Obx(
//                   () => AnimatedPadding(
//                 padding: EdgeInsetsGeometry.all(_reactive.isVisible.value ? 80 : 0),
//                 duration: Duration(seconds: 1),
//                 child: AnimatedContainer(
//                   height: _reactive.isVisible.value ? 0 : 200,
//                   color: Colors.blue,
//                   duration: Duration(seconds: 1),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
