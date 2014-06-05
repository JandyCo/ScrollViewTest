package;

import openfl.display.Sprite;
import openfl.display.Shape;

import openfl.events.MouseEvent;

import openfl.text.TextField;

import com.jandyco.container.ScrollView;


class Main extends Sprite {
    private var scrollView : ScrollView;
	
	public function new () {
		super ();
		scrollView = new ScrollView({width:stage.stageWidth, height:stage.stageHeight});
		addChild(scrollView);

        createFPS();
        createMaskToggle();
        createCacheAsBitmapToggle();
		
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

    private function createFPS() {
        var fps = new openfl.display.FPS(100,0,0x000000);
        fps.defaultTextFormat = new openfl.text.TextFormat(null,32);
        fps.autoSize = openfl.text.TextFieldAutoSize.LEFT;
        addChild(fps);
    }

    private function createMaskToggle() {
       var textField = createText("Enable Mask", 100, 50);
       textField.addEventListener(MouseEvent.CLICK, function (event : MouseEvent) {
            textField.text = textField.text == "Enable Mask" ? "Disable Mask" : "Enable Mask";
            scrollView.toggleMask();
       });
    }

    private function createCacheAsBitmapToggle() {
       var textField = createText("Enable Cache As Bitmap", 100, 100);
       textField.addEventListener(MouseEvent.CLICK, function (event : MouseEvent) {
            textField.text = textField.text == "Enable Cache As Bitmap" ? "Disable Cache As Bitmap" : "Enable Cache As Bitmap";
            scrollView.toggleCacheAsBitmap();
       });
    }
	
    public function createText(text, x, y) {
        var textField = new TextField(); 
       textField.defaultTextFormat = new openfl.text.TextFormat(null, 32);
       textField.autoSize = openfl.text.TextFieldAutoSize.LEFT;

       textField.text = text;

       textField.x = x;
       textField.y = y;
       addChild(textField);
       return textField;
    }
	
}
