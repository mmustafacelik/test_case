import 'package:appnation_test_case/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

void main() {
  // FlutterNativeSplash.preserve(
  // widgetsBinding:
  // );
  runApp(
    MaterialApp(
      home: const MyApp(),
      theme: ThemeData(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: GridView.count(
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
                    insetPadding: EdgeInsets.symmetric(horizontal: 16),
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
        ));
  }
}
