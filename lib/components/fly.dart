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
	Offset targetLocation;
	double get speed => game.tileSize * 3; // getter for the speed property

	Fly(this.game) {
		setTargetLocation();
	}

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
			flyingSpriteIndex += 30 * t;
			if (flyingSpriteIndex >= 2) {
				flyingSpriteIndex -= 2;
			}

			double stepDistance = speed * t;
			Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
			if (stepDistance < toTarget.distance) {
				Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
				flyRect = flyRect.shift(stepToTarget);
			} else {
				flyRect = flyRect.shift(toTarget);
				setTargetLocation();
			}
		}
	}

	void kill() {
		isDead = true;
		game.spawnFly(); // create a new fly each time one dies
	}

	void setTargetLocation() {
		double x = game.rand.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
		double y = game.rand.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
		targetLocation = Offset(x, y);
	}
}