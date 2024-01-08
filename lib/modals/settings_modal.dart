import 'package:flutter/material.dart';

class SettingsModal extends ModalRoute {
  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  //Aşağıdna yukarı gelen kısm
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return Container(
      //backgorund color
      color: Colors.white,
      child: SlideTransition(
        position: animation.drive(tween),
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: barrierColor,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () {
                  // OdamaxNavigator.pop();
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        13,
                      ),
                      topRight: Radius.circular(
                        13,
                      ),
                    ),
                  ),
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  child: const _Body(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  //aşağıdan gelme süresi
  Duration get transitionDuration => const Duration(milliseconds: 375);
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            // Get.put(
            //   ProfilePageController(),
            // );
            // OdamaxNavigator.push(
            //   "/profile",
            // );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      height: 40,
                      width: 40,
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          'test',
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'bune',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.amber,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'bune2',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'bune3',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 28,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),

              const SizedBox(
                height: 24,
              ),

              // 28 + 4 = 32
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
