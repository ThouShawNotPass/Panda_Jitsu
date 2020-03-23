import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:panda_jitsu/components/fly.dart';
import 'package:panda_jitsu/jitsu-game.dart';

class DroolerFly extends Fly {
  DroolerFly(JitsuGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}