import h2d.Scene;
import hxd.Key in K;

class Main extends hxd.App {
	public var key:{
		left:Bool,
		right:Bool,
		up:Bool,
		down:Bool
	};
	public var hero:h2d.Graphics;

	var pad:hxd.Pad;

	static var PAD = hxd.Pad.DEFAULT_CONFIG;

	override function init() {
		var tf:h2d.Text = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.setScale(2.0);
		tf.text = "Hello World !\nJust press arrow keys";

		// Create a custom graphics object by passing a 2d scene reference.
		hero = new h2d.Graphics(s2d);

		hero.beginFill(0xEA8220);
		hero.drawRect(50, 50, 110, 110);
		hero.endFill();

		/**
		 * Key Press
		 */
		pad = hxd.Pad.createDummy();
	}

	override function update(dt:Float) {
		dt *= 60; // old dt support

		var left:Bool = K.isDown(K.LEFT) || K.isDown("A".code) || K.isDown("A".code) || pad.xAxis < -0.5;
		var right:Bool = K.isDown(K.RIGHT) || K.isDown("D".code) || pad.xAxis > 0.5;
		var up:Bool = K.isDown(K.UP) || K.isDown("W".code) || pad.yAxis > 0.5;
		var down:Bool = K.isDown(K.DOWN) || K.isDown("S".code) || pad.yAxis < -0.5;

		key = {
			left: left,
			right: right,
			up: up,
			down: down
		};

		if (key.left) {
			trace('left tapped');
			hero.x -= 1;
		} else if (key.right) {
			trace('right tapped');
			hero.x += 1;
		}

		if (key.up) {
			hero.y -= 1;
		} else if (key.down) {
			hero.y += 1;
		}
	}

	static function main() {
		new Main();
	}
}
