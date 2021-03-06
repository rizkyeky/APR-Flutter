library page;

import 'package:animations/animations.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

import '../../bloc/bloc.dart';
import '../../injector.dart';
import '../../model/model.dart';
import '../../service/service.dart';

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

  void init() {
    bloc.init();

  }

  void dispose() {
    bloc.dispose();
  }
}

class _PageState extends State<Page> {
  bool hasOffline = false;
  bool hasOnline = false;

  @override
  void initState() {
    widget.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    injector.screenHeight = MediaQuery.of(context).size.height;
    injector.screenWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<ConnectionStatus>(
      valueListenable: injector.networkStatusNotifier,
      builder: (context, value, child) {
        checkConnection(value);
        return child;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: injector.rebuildNotifier,
        builder: (context, value, _) {
          return widget.build(context);
        }
      ),
    );
  }

  void checkConnection(ConnectionStatus status) {
    if (widget.hasNetworkSnack) {
      if (status == ConnectionStatus.offline && !hasOffline) {
        Future.delayed(const Duration(milliseconds: 500))
          .whenComplete(() => showFlash(
            context: context,
            duration: const Duration(seconds: 3),
            builder: (context, controller) {
              return SnackFlashBar(
                controller: controller,
                contentMessage: 'OFFLINE',
                actionMessage: 'DISMISS',
              );
            }
          ));
        hasOffline = true;
        hasOnline = false;
      } else if (status == ConnectionStatus.online && !hasOnline && hasOffline) {
        Future.delayed(const Duration(milliseconds: 500))
          .whenComplete(() => showFlash(
            context: context,
            duration: const Duration(seconds: 1),
            builder: (context, controller) => SnackFlashBar(
              controller: controller,
              contentMessage: 'ONLINE',
              actionMessage: 'DISMISS',
            )
          ));
        hasOffline = false;
        hasOnline = true;
      }
    }
  }
}
