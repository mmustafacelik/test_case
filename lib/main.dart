import 'package:appnation_test_case/consts/assets_path.dart';
import 'package:appnation_test_case/consts/sizes.dart';
import 'package:appnation_test_case/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(
    MaterialApp(
      home: const MyApp(),
      theme: ThemeData(
        textTheme: const TextTheme(
          //Headline1 yerine kullanılıyor.
          // displayLarge: GoogleFonts.montserrat(
          //   textStyle: const TextStyle(
          //     color: neutral80,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 36,
          //   ),
          // ),
          // //Headline2 yerine kullanılıyor.
          // displayMedium: GoogleFonts.montserrat(
          //   textStyle: const TextStyle(
          //     color: neutral80,
          //     fontWeight: FontWeight.w700,
          //     fontSize: 26,
          //   ),
          // ),
          // //Headline3 yerine kullanılıyor.
          // displaySmall: GoogleFonts.montserrat(
          //   textStyle: const TextStyle(
          //     color: neutral80,
          //     fontWeight: FontWeight.w700,
          //     fontSize: 18,
          //   ),
          // ),
          // //Headline4 yerine kullanılıyor.
          // headlineMedium: GoogleFonts.montserrat(
          //   textStyle: const TextStyle(
          //     color: neutral80,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 18,
          //   ),
          // ),
          // bodyLarge: GoogleFonts.montserrat(
          //   textStyle: const TextStyle(
          //     color: neutral80,
          //     fontWeight: FontWeight.w400,
          //     fontSize: 16,
          //   ),
          // ),
          bodyMedium: TextStyle(
            fontFamily: 'Galano Grotesque',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Galano Grotesque',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(
            0xffF2F2F7,
          ),
          endIndent: 31,
          indent: 31,
        ),
        fontFamily: 'Galano Grotesque',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                color: Colors.white,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              Colors.blue,
            ),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const platform = const MethodChannel('platform_channel_example');

  @override
  Widget build(BuildContext context) {
    Future<String> getPlatformVersion() async {
      try {
        return await platform.invokeMethod('getPlatformVersion');
      } on PlatformException catch (e) {
        return 'Failed to get platform version: $e';
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Stack(
        children: [
          GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              'https://picsum.photos/200',
                              height: context.height / 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print('pop');
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      titlePadding: const EdgeInsets.all(0),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16.0),
                            const Text(
                              'Generate',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                            const Divider(),
                            const Text(
                              'Metin 2',
                            ),
                            const Text('Metin 3'),
                            const Text('Metin 4'),
                            const Text('Metin 5'),
                            const SizedBox(height: 16.0),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 56,
                                      child: TextButton(
                                        onPressed: () {
                                          // "Generate" butonuna tıklandığında yapılacak işlemleri buraya ekleyin
                                        },
                                        child: const Text(
                                          'Generate',
                                          style: TextStyle(
                                            fontFamily: 'Galano Grotesque',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // showGeneralDialog(
                  //   context: context,
                  //   pageBuilder: (context, animation, secondaryAnimation) {
                  //     return Container();
                  //   },
                  //   transitionBuilder:
                  //       (context, animation, secondaryAnimation, child) {
                  //     return ScaleTransition(
                  //       scale:
                  //           Tween<double>(begin: .5, end: 1).animate(animation),
                  //       child: AlertDialog(
                  //         iconColor: Colors.red,
                  //         title: Image.network('https://picsum.photos/200'),
                  //         content: const Text('Testtt DENEMEeEEEEEe'),
                  //         shape: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(
                  //             16.0,
                  //           ),
                  //           borderSide: BorderSide.none,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                height: 100,
                width: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                height: 100,
                width: 100,
              ),
              Container(
                width: 200.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Merhaba!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                height: 100,
                width: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                height: 100,
                width: 100,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.teal,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: GestureDetector(
                            onVerticalDragUpdate: (details) {
                              int sensitivity = 8;
                              if (details.delta.dy > sensitivity) {
                                print('down');
                              } else if (details.delta.dy < -sensitivity) {
                                print('up');
                              }
                            },
                            child: SingleChildScrollView(
                              controller: ScrollController(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                width: double.infinity,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: Sizes.p4,
                                      margin: const EdgeInsets.only(
                                        top: Sizes.p16,
                                        bottom: Sizes.p16,
                                      ),
                                      width: Sizes.p32,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            50,
                                          ),
                                        ),
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextFormField(
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      // autofocus: true,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 68,
                    width: context.width - 32,
                    margin: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border:
                          Border.all(color: const Color(0xffE5E5EA), width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Sizes.p8,
                      ),
                    ),
                    child: Row(
                      children: [
                        gapW16,
                        Text(
                          'Search',
                          style: context.bodMid?.copyWith(
                              color: const Color(
                            0xff3C3C43,
                          ).withOpacity(.6)),
                        ),
                      ],
                    ),
                  ),
                ),
                gapH16,
                GestureDetector(
                  onTap: () async {
                    final platformVersion = await getPlatformVersion();
                    if (context.mounted) {
                      settingsBottomSheet(context,
                          platformVersion: platformVersion);
                    }
                  },
                  child: Container(
                    width: context.width,
                    color: Colors.pink,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> settingsBottomSheet(BuildContext context,
      {required String platformVersion}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Ekranın tamamını kaplamasını sağlamak için true olarak ayarlayın
      builder: (BuildContext context) {
        return Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Sizes.p4,
                margin: const EdgeInsets.only(
                  top: Sizes.p16,
                  bottom: Sizes.p16,
                ),
                width: Sizes.p32,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                  color: Colors.grey,
                ),
              ),
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      const CustomListTileWidget(
                        assetPath: AssetsPath.infoIcon,
                        text: 'Help',
                      ),
                      const CustomListTileWidget(
                        assetPath: AssetsPath.starIcon,
                        text: 'Rate Us',
                      ),
                      const CustomListTileWidget(
                        assetPath: AssetsPath.shareIcon,
                        text: 'Share with Friends',
                      ),
                      const CustomListTileWidget(
                        assetPath: AssetsPath.termsIcon,
                        text: 'Terms of Use',
                      ),
                      const CustomListTileWidget(
                        assetPath: AssetsPath.privacyIcon,
                        text: 'Privacy Policy',
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          AssetsPath.osVersionIcon,
                        ),
                        title: Text(
                          'OS Version',
                          style: context.bodMid,
                        ),
                        trailing: Text(
                          platformVersion,
                          style: context.bodSml?.copyWith(
                            color: const Color(
                              0xffC7C7CC,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).toList()),
            ],
          ),
        );
      },
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.assetPath,
    required this.text,
  });
  final String text;
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        assetPath,
      ),
      title: Text(
        text,
        style: context.bodMid,
      ),
      trailing: const Icon(
        Icons.arrow_outward,
        color: Color(0xffC7C7CC),
      ),
    );
  }
}
