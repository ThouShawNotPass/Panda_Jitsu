import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:panda_jitsu/jitsu-game.dart';

// This is a fly object, it encapsulates its own render and update methods.
// Individual flies will have their own subclasses and implementions.
class Fly {
	final JitsuGame game;
	List<Sprite> flyingSprite;
	Sprite deadSprite;
	double flyingSpriteIndex = 0;	
	bool isOffScreen = false;
	bool isDead = false;
	Rect flyRect;

	Fly(this.game); // constructs new fly object with reference to game

	void render(Canvas c) {
		// .inflate(2) makes sprite 2x bigger than hitbox (flyRect)
		if (isDead) {
			deadSprite.renderRect(c, flyRect.inflate(2));
		} else {
			flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
		}
	}

	// Update the position of the fly (given time t since last update in seconds)
	void update(double t) {
		if (isDead) {
			flyRect = flyRect.translate(0, game.tileSize * 12 * t); // fall 12 tiles per second
			if (flyRect.top > game.screenSize.height) {
				isOffScreen = true;
			}
		} else {
			flyingSpriteIndex = t % 2;
			// flyingSpriteIndex += 30 * t;
			// if (flyingSpriteIndex >= 2) {
			// 	flyingSpriteIndex -= 2;
			// }
		}
	}

	void kill() {
		isDead = true;
		game.spawnFly(); // create a new fly each time one dies
	}
}