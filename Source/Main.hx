package;

import openfl.display.Sprite;

import com.jandyco.container.ScrollView;


class Main extends Sprite {
	
	public function new () {
		
		super ();
		var scrollView = new ScrollView({width:stage.stageWidth, height:stage.stageHeight});
		addChild(scrollView);

        var fps = new openfl.display.FPS(100,0,0x000000);
        fps.defaultTextFormat = new openfl.text.TextFormat(null,32);
        fps.autoSize = openfl.text.TextFieldAutoSize.LEFT;
        addChild(fps);
		
        var sp = createSquare(0x0000FF);
        scrollView.addChild(sp);
        for (i in 1...18 ) {
            var color =  (i % 2 == 0) ? 0xFF0000 : 0x00FF00;
            var sp = createSquare(color);
            sp.y = 10 * i + sp.height * i;
            scrollView.addChild(sp);
        }
        var sp = createSquare(0x0000FF);
        sp.y = 10 * 18 + sp.height * 18;
        scrollView.addChild(sp);
	}

    private function createSquare(color) {
        var sp = new Sprite();
        sp.graphics.beginFill(color); 
        sp.graphics.drawRect(0,0,100,100);
        sp.graphics.endFill();
        return sp;
    }
	
	
}
