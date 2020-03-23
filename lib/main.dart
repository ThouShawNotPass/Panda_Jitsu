import 'package:flame/util.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:panda_jitsu/jitsu-game.dart';

void main() async {
	// This is the glue that binds the framework to the Flutter engine.
	WidgetsFlutterBinding.ensureInitialized();

	// make full screen and portrait mode (lock)
	Util flameUtil = Util();
	await flameUtil.fullScreen();
	await flameUtil.setOrientation(DeviceOrientation.portraitUp);

	// load all assets (cached in a static variable in Flame to reuse later)
	Flame.images.loadAll(<String>[
	'bg/backyard.png',
	'flies/agile-fly-1.png',
	'flies/agile-fly-2.png',
	'flies/agile-fly-dead.png',
	'flies/drooler-fly-1.png',
	'flies/drooler-fly-2.png',
	'flies/drooler-fly-dead.png',
	'flies/house-fly-1.png',
	'flies/house-fly-2.png',
	'flies/house-fly-dead.png',
	'flies/hungry-fly-1.png',
	'flies/hungry-fly-2.png',
	'flies/hungry-fly-dead.png',
	'flies/macho-fly-1.png',
	'flies/macho-fly-2.png',
	'flies/macho-fly-dead.png',
	]);

	// create a new instance of the game object
	JitsuGame game = JitsuGame();
	runApp(game.widget);

	// create a gesture recogniser and pass it to game object
	TapGestureRecognizer tapper = TapGestureRecognizer();
	tapper.onTapDown = game.onTapDown;
	flameUtil.addGestureRecognizer(tapper);
}