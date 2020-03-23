import 'dart:ui';
import 'package:panda_jitsu/jitsu-game.dart';

// This is the dojo background class which defines behavior for the background.
// Note: Most mobile devices have a screen width of 9:12-18.5 so our bg is 9:23.
class Card {
	final JitsuGame game;
  	Rect bgRect;

	Card(this.game);

	void render(Canvas c) {
		drawCard(c);
	}

	void drawCard(Canvas c) {
		double screenCenterX = game.screenSize.width / 2;
		double screenCenterY = game.screenSize.height / 2;
		Rect boxRect = Rect.fromLTWH(
			screenCenterX - 75,
			screenCenterY - 75,
			150,
			150
		);
		Paint boxPaint = Paint();
		boxPaint.color = Color(0xffffffff);
		c.drawRect(boxRect, boxPaint);
	}

	void update(double t) {}
}