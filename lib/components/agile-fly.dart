import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:panda_jitsu/components/fly.dart';
import 'package:panda_jitsu/jitsu-game.dart';

class AgileFly extends Fly {
  AgileFly(JitsuGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}