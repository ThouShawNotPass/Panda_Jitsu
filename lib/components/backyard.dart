import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:panda_jitsu/jitsu-game.dart';

// This is the backyard background class which defines behavior for the background.
// Note: Most mobile devices have a screen width of 9:12-18.5 so our bg is 9:23.
class Backyard {
	final JitsuGame game;
  	Rect bgRect;
	Sprite bgSprite;

	Backyard(this.game) {
		bgSprite = Sprite('bg/backyard.png');
		// for a background image 1080:2760px (9:23)
		bgRect = Rect.fromLTWH(
			0, // Left: starting on left edge
			game.screenSize.height - (game.tileSize * 23), // Top: starts 23 'tiles' above the bottom
			game.screenSize.width, // Width: 'full width'
			game.tileSize * 23 // Height: 23 'tiles'
		);
	}

	void render(Canvas c) {
		bgSprite.renderRect(c, bgRect);
	}

	void update(double t) {}
}