import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//----------------------------------------------------------
//                        SLIDE
//----------------------------------------------------------
class _CustomSlideTransition extends CustomTransitionPage {
  _CustomSlideTransition(
      {required super.child, required Tween<Offset> position})
      : super(transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: position.animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
                reverseCurve: Curves.easeOut,
              ),
            ),
            child: child,
          );
        });
}

class RightSlideTransition extends _CustomSlideTransition {
  RightSlideTransition({required super.child})
      : super(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ),
        );
}

class LeftSlideTransition extends _CustomSlideTransition {
  LeftSlideTransition({required super.child})
      : super(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ),
        );
}

class TopSlideTransition extends _CustomSlideTransition {
  TopSlideTransition({required super.child})
      : super(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ),
        );
}

class BottomSlideTransition extends _CustomSlideTransition {
  BottomSlideTransition({required super.child})
      : super(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ),
        );
}

//----------------------------------------------------------
//                        SCALE
//----------------------------------------------------------
class CustomScaleTransition extends CustomTransitionPage {
  CustomScaleTransition({required super.child})
      : super(transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            alignment: Alignment.bottomCenter,
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutSine,
                reverseCurve: Curves.easeInSine,
              ),
            ),
            child: child,
          );
        });
}

// class CustomScaleTransition extends CustomTransitionPage {
//   CustomScaleTransition({required super.child})
//       : super(transitionsBuilder:
//             (context, animation, secondaryAnimation, child) {
//           return ScaleTransition(
//             scale: animation.drive(
//               Tween<double>(begin: 0.0, end: 1.0).chain(
//                 CurveTween(
//                   curve: Interval(0.0, 0.5, curve: Curves.elasticIn),
//                 ),
//               ),
//             ),
//             child: ScaleTransition(
//               scale: Tween<double>(begin: 1.5, end: 1.0).animate(
//                 CurvedAnimation(
//                   parent: animation,
//                   curve: Interval(0.5, 1.0, curve: Curves.elasticInOut),
//                 ),
//               ),
//               child: child,
//             ),
//           );
//         });
// }
//----------------------------------------------------------
//                        FADE
//----------------------------------------------------------
class CustomFadeTransition extends CustomTransitionPage {
  CustomFadeTransition({required super.child})
      : super(transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutSine,
                reverseCurve: Curves.easeInSine,
              ),
            ),
            child: child,
          );
        });
}

//----------------------------------------------------------
//                        EMPTY
//----------------------------------------------------------
class CustomEmptyTransition extends CustomTransitionPage {
  CustomEmptyTransition({required super.child})
      : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
}
