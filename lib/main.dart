import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_prompt_app/routs/routes.dart';

import 'core/constants/app_strings.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: Routes.router,
        theme: ThemeData(fontFamily: AppStrings.quilon),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(home: CustomBottomNav()));
// }
//
// class CustomBottomNav extends StatefulWidget {
//   @override
//   _CustomBottomNavState createState() => _CustomBottomNavState();
// }
//
// class _CustomBottomNavState extends State<CustomBottomNav> {
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       // Dummy Screens
//       body: Center(
//         child: Text(
//           ["Home", "Favorite", "Profile"][currentIndex],
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//
//       bottomNavigationBar: Container(
//         height: 75,
//         decoration: BoxDecoration(
//           color: Color(0xff2f2f2f),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(35),
//             topRight: Radius.circular(35),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             /// -------- HOME ---------- ///
//             GestureDetector(
//               onTap: () => setState(() => currentIndex = 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   currentIndex == 0
//                       ? Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.home,
//                             color: Colors.white,
//                             size: 26,
//                           ),
//                         )
//                       : Icon(Icons.home, color: Colors.white, size: 26),
//
//                   SizedBox(height: 5),
//
//                   currentIndex == 0
//                       ? Text(
//                           "Home",
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         )
//                       : SizedBox(),
//                 ],
//               ),
//             ),
//
//             /// -------- Favorite ---------- ///
//             GestureDetector(
//               onTap: () => setState(() => currentIndex = 1),
//               child: Icon(
//                 Icons.favorite,
//                 size: 28,
//                 color: currentIndex == 1 ? Colors.red : Colors.white,
//               ),
//             ),
//
//             /// -------- Profile ---------- ///
//             GestureDetector(
//               onTap: () => setState(() => currentIndex = 2),
//               child: Icon(
//                 Icons.person,
//                 size: 28,
//                 color: currentIndex == 2 ? Colors.red : Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
