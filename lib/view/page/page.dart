library page;

import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../bloc/bloc.dart';
import '../../injector.dart';

import '../../theme.dart';
import '../component/component.dart';

part 'home.dart';
part 'entry.dart';
part 'login.dart';
part 'tab.dart';
part 'profile.dart';
part 'ide_bisnis.dart';
part 'pelatihan.dart';
part 'ide_bisnis_detail.dart';
part 'pelatihan_detail.dart';

abstract class Page<T extends Bloc> extends StatefulWidget {

  Page({
    Key key,
    this.hasNetworkSnack = false
  }) : super(key: key);

  final T bloc = injector.getBloc<T>();
  final bool hasNetworkSnack; 

  @override
  _PageState createState() => _PageState();

  @protected
  Widget build(BuildContext context);

  @protected
  void init();

  @protected
  void dispose();
}

class _PageState extends State<Page> {
  bool hasOffline = false;
  bool hasOnline = false;

  Image placeHolder;

  @override
  void initState() {
    widget.init();
    widget.bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    injector.screenHeight = MediaQuery.of(context).size.height;
    injector.screenWidth = MediaQuery.of(context).size.width;

    // return ValueListenableBuilder<ConnectionStatus>(
    //   valueListenable: injector.getService<ConnectionService>().networkStatusNotifier,
    //   builder: (context, value, child) {
    //     if (widget.hasNetworkSnack) {
    //       if (value == ConnectionStatus.offline && !hasOnline) {
    //         Future.delayed(const Duration(milliseconds: 500))
    //           .whenComplete(() => showFlash(
    //             context: context,
    //             duration: const Duration(seconds: 3),
    //             builder: (context, controller) => SnackFlashBar(
    //               controller: controller,
    //               contentMessage: 'OFFLINE',
    //               actionMessage: 'DISMISS',
    //             )
    //           ));
    //         hasOffline = true;
    //       } else if (hasOffline) {
    //         Future.delayed(const Duration(milliseconds: 500))
    //           .whenComplete(() => showFlash(
    //             context: context,
    //             duration: const Duration(seconds: 1),
    //             builder: (context, controller) => SnackFlashBar(
    //               controller: controller,
    //               contentMessage: 'ONLINE',
    //               actionMessage: 'DISMISS',
    //             )
    //           ));
    //         hasOnline = true;
    //       }
    //     }
    //     return child;
    //   },
    //   child: widget.build(context),
    // );
    return widget.build(context);
  }
}
