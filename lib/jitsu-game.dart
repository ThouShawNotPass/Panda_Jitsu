import 'dart:ui'; // access to Canvas and Size
import 'dart:math'; // for random integer generation
import 'package:flame/flame.dart'; // access Flame Util's initialDimensions
import 'package:flame/game.dart'; // access Flame Game-Loop scaffolding
import 'package:flutter/gestures.dart';
import 'package:panda_jitsu/components/fly.dart'; // import the Fly class/object
import 'package:panda_jitsu/components/house-fly.dart';
import 'package:panda_jitsu/components/agile-fly.dart';
import 'package:panda_jitsu/components/drooler-fly.dart';
import 'package:panda_jitsu/components/hungry-fly.dart';
import 'package:panda_jitsu/components/macho-fly.dart';
import 'package:panda_jitsu/components/backyard.dart'; // import the background

// This is a JitsuGame class that has gameloop logic in it to control a jitsu game. 
// It overrides the basic (empty) Game methods 'render' && 'update'.
class JitsuGame extends Game {
	Size screenSize; // the size of the current device's screen
	double tileSize; // the tile size for current screen resolution (1/9th screen width)
	List<Fly> flies; // keep track of the flies in the game
	Backyard background; // keep track of the background
	Random rand; // generates new random integers

	JitsuGame() {
		initialize(); // constructors cannot be async but this function can be
	}

	// Paints the new canvas
	void render(Canvas canvas) {
		background.render(canvas);
		flies.forEach((Fly fly) => fly.render(canvas)); // draws each fly
	}

	void update(double t) {
		flies.forEach((Fly fly) => fly.update(t));
		flies.removeWhere((Fly fly) => fly.isOffScreen);
	}

	// Calculates the size of the current screen and updates instance variable
	void resize(Size size) {
		screenSize = size;
		tileSize = size.width / 9;
	}

	void onTapDown(TapDownDetails d) {
		flies.forEach((Fly fly) {
			// check if the fly area contains the tap point
			if (fly.flyRect.contains(d.globalPosition)) {
				fly.kill();
			}
		});
	}

	// Initialize the game. Should be called exactly once, using async to wait for screenSize
	void initialize() async {
		flies = List<Fly>(); // initialize a list of Fly objects
		rand = Random();
		resize(await Flame.util.initialDimensions()); // get dimensions (returns Future<Size>)
		
		background = Backyard(this);
		spawnFly();
	}

	// spawns a fly at (50, 50)
	void spawnFly() {
		double x = rand.nextDouble() * (screenSize.width - (tileSize * 2.025));
		double y = rand.nextDouble() * (screenSize.height - (tileSize * 2.025));
		switch (rand.nextInt(5)) {
			case 0:
				flies.add(HouseFly(this, x, y));
				break;
			case 1:
				flies.add(DroolerFly(this, x, y));
				break;
			case 2:
				flies.add(AgileFly(this, x, y));
				break;
			case 3:
				flies.add(MachoFly(this, x, y));
				break;
			case 4:
				flies.add(HungryFly(this, x, y));
				break;	
		}
	}
}