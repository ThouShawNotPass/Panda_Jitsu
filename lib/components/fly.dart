import 'dart:ui';
import 'package:panda_jitsu/jitsu-game.dart';

// This is a fly object, it encapsulates its own render and update methods.
// Individual flies will have their own subclasses and implementions.
class Fly {
	final JitsuGame game;
	bool isOffScreen = false;
	bool isDead = false;
	Paint flyPaint;
	Rect flyRect;

	Fly(this.game, double x, double y) {
		flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
		flyPaint = Paint();
		flyPaint.color = Color(0xff6ab04c);
	}

	void render(Canvas c) {}

	void update(double t) {
		if (isDead) {
			flyRect = flyRect.translate(0, game.tileSize * 12 * t);
			if (flyRect.top > game.screenSize.height) {
				isOffScreen = true;
			}
		}
	}

	void kill() {
		isDead = true;
		flyPaint.color = Color(0xffff4757);
		game.spawnFly(); // create a new fly each time one dies
	}
}