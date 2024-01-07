import 'package:appnation_test_case/blocs/bottom_sheet_container/bloc/heigh_of_container_bloc.dart';
import 'package:appnation_test_case/blocs/dog_species/dog_species_bloc.dart';
import 'package:appnation_test_case/blocs/dog_species/dog_species_state.dart';
import 'package:appnation_test_case/consts/assets_path.dart';
import 'package:appnation_test_case/consts/sizes.dart';
import 'package:appnation_test_case/utils/extensions/context_extensions.dart';
import 'package:appnation_test_case/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DogSpeciesBloc>(
          create: (context) => DogSpeciesBloc(),
        ),
        BlocProvider<HeighOfContainerBloc>(
          create: (context) => HeighOfContainerBloc(),
        ),
      ],
      child: MaterialApp(
        // navigatorKey: ,
        home: const MyApp(),
        theme: CustomTheme().theme,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogSpeciesBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Stack(
          children: [
            BlocListener<DogSpeciesBloc, DogSpeciesState>(
              listener: (context, state) async {
                if (state is DogSpeciesInitial) {
                } else if (state is DogSpeciesLoading) {
                } else if (state is DogSpeciesLoaded) {
                  for (var element
                      in state.dogSpeciesModel.message?.keys ?? <String>[]) {
                    var photo = state.dogSpeciesModel.photo?[element];
                    // print('fotoğraflarr' + photo.toString());
                    if (photo == null) {
                      continue;
                    }
                    await precacheImage(NetworkImage(photo!), context);
                  }
                  FlutterNativeSplash.remove();

                  // print('Load oldu');
                } else if (state is DogSpeciesError) {
                  // print('error');
                } else {}
              },
              child: BlocBuilder<DogSpeciesBloc, DogSpeciesState>(
                  builder: (context, state) {
                if (state is! DogSpeciesLoaded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  itemCount: state.dogSpeciesModel.message?.length,
                  itemBuilder: (context, index) => _item(
                      context,
                      state.dogSpeciesModel.message?.keys.toList()[index] ?? '',
                      state.dogSpeciesModel.photo?[state
                              .dogSpeciesModel.message?.keys
                              .toList()[index]] ??
                          '',
                      state.dogSpeciesModel.message?.values.toList()[index]),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                );
              }),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  BlocProvider(
                    create: (context) => HeighOfContainerBloc(),
                    child: const SearchBar(),
                  ),
                  gapH16,
                  GestureDetector(
                    onTap: () async {
                      Future<String> getPlatformVersion() async {
                        try {
                          return await const MethodChannel(
                                  'platform_channel_example')
                              .invokeMethod('getPlatformVersion');
                        } on PlatformException catch (e) {
                          return 'Failed to get platform version: $e';
                        }
                      }

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
      ),
    );
  }

  GestureDetector _item(
    BuildContext context,
    String speciesName,
    String speciesPhoto,
    List<String>? subBreedsList,
  ) {
    return GestureDetector(
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
                    speciesPhoto,
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
                  Text(
                    'Bread',
                    style: context.bodMid?.copyWith(
                      fontSize: 20,
                      color: const Color(
                        0xff0055D3,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    speciesName,
                    style: context.bodMid,
                  ),
                  Text(
                    'Sub Bread',
                    style: context.bodMid?.copyWith(
                      fontSize: 20,
                      color: const Color(
                        0xff0055D3,
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: context.height / 10,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: subBreedsList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            subBreedsList?[index] ?? '',
                            style: context.bodMid,
                          ),
                        );
                      },
                    ),
                  ),
                  gapH16,
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/200',
                                            width: double.infinity,
                                            height: context.height / 3,
                                            fit: BoxFit.cover,
                                          ),
                                          gapH8,
                                          SizedBox(
                                            height: 32,
                                            width: 32,
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      2,
                                                    ),
                                                  ),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
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
          image: DecorationImage(
            image: NetworkImage(speciesPhoto),
            fit: BoxFit.cover,
          ),
        ),
        height: 100,
        width: 100,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: context.height / 20,
            width: context.width / 5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(
                  Sizes.p16,
                ),
              ),
              color: const Color(0xff000000).withOpacity(.50),
            ),
            child: Center(
              child: Text(
                speciesName,
                style: context.bodMid?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    BlocProvider.of<HeighOfContainerBloc>(context)
                        .add(HeighDecremented());
                    print('down');
                  } else if (details.delta.dy < -sensitivity) {
                    BlocProvider.of<HeighOfContainerBloc>(context)
                        .add(HeighIncremented());
                    print('up');
                  }
                },
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child:
                      BlocBuilder<HeighOfContainerBloc, HeighOfContainerState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: double.infinity,
                        height: state.value,
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
                            Padding(
                              padding: const EdgeInsets.all(
                                Sizes.p16,
                              ),
                              child: TextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Search',
                                ),
                                // autofocus: true,
                              ),
                            )
                          ],
                        ),
                      );
                    },
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
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(color: const Color(0xffE5E5EA), width: 2),
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
