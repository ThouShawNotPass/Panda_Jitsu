import 'dart:ui'; // access to Canvas and Size
import 'dart:math'; // for random integer generation
import 'package:flame/flame.dart'; // access Flame Util's initialDimensions
import 'package:flame/game.dart'; // access Flame Game-Loop scaffolding
import 'package:flutter/gestures.dart';
import 'package:panda_jitsu/components/dojo.dart'; // import the background

// This is a JitsuGame class that has gameloop logic in it to control a jitsu game. 
// It overrides the basic (empty) Game methods 'render' && 'update'.
class JitsuGame extends Game {
	Size screenSize; // the size of the current device's screen
	double tileSize; // the tile size for current screen resolution (1/9th screen width)
	Dojo background; // keep track of the background
	Random rand; // generates new random integers

	JitsuGame() {
		initialize(); // constructors cannot be async but this function can be
	}

	// Paints the new canvas
	void render(Canvas canvas) {
		background.render(canvas);
	}

	void update(double t) {}

	// Calculates the size of the current screen and updates instance variable
	void resize(Size size) {
		screenSize = size;
		tileSize = size.height / 9; // the screen will be 9 'tiles' high
	}

	void onTapDown(TapDownDetails d) {}

	// Initialize the game. Should be called exactly once, using async to wait for screenSize
	void initialize() async {
		resize(await Flame.util.initialDimensions()); // get dimensions (returns Future<Size>)
		
		background = Dojo(this);
	}
}