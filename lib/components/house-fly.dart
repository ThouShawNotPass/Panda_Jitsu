import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:panda_jitsu/components/fly.dart';
import 'package:panda_jitsu/jitsu-game.dart';

class HouseFly extends Fly {
	// "Foo(...) : super(...)" syntax means call super() before this()
	HouseFly(JitsuGame game, double x, double y) : super(game) {
		flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
		flyingSprite.add(Sprite('flies/house-fly-1.png'));
		flyingSprite.add(Sprite('flies/house-fly-2.png'));
		deadSprite = Sprite('flies/house-fly-dead.png');
	}
}