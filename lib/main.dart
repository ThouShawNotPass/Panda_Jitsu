import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:panda_jitsu/jitsu-game.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();

	Util flameUtil = Util();
	await flameUtil.fullScreen();
	await flameUtil.setOrientation(DeviceOrientation.portraitUp);

	JitsuGame game = JitsuGame();
	runApp(game.widget);

	TapGestureRecognizer tapper = TapGestureRecognizer();
	tapper.onTapDown = game.onTapDown;
	flameUtil.addGestureRecognizer(tapper);
}