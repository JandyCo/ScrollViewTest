package com.jandyco.container;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.Shape;

import openfl.geom.Point;

import com.jandyco.container.scrollview.ScrollViewContent;
import com.jandyco.container.scrollview.BasicScrollBehavior;


@:allow(com.jandyco.container.scrollview)
class ScrollView extends Sprite {
    private var content : ScrollViewContent;
    private var scrollBehavior = null;

    private var maxWidth : Float;
    private var maxHeight : Float;

    private var clipMask  : Shape;

    public function new(?style : Dynamic) {
        super();

        maxWidth = style !=null && style.width != null ? style.width : openfl.Lib.stage.stageWidth;
        maxHeight = style !=null && style.height != null ? style.height : openfl.Lib.stage.stageHeight;
        createBackground();
        createClippingMask();
        toggleMask();
        content = new ScrollViewContent(maxWidth, maxHeight);
        super.addChild(content);
        scrollBehavior = new BasicScrollBehavior(this);
    }


     /** 
     *  Create a transparent background to trap touch events.
     */
    private function createBackground() {
        var background = new Sprite();
        background.graphics.beginFill(0x000000,0);
        background.graphics.drawRect(0,0,maxWidth,maxHeight);
        super.addChild(background);
    }

    public function toggleMask() {
        if (this.mask != null) {
            this.mask = null;
        } else {
            this.mask = clipMask;
        }
    }

    /**
     * Create a shape to clip the display of the scrollview contents to its height and width.
     */
    private function createClippingMask() {
        clipMask = new Shape();
        clipMask.graphics.beginFill(0xFF0000);
        clipMask.graphics.drawRect(this.x, this.y, maxWidth, maxHeight);
        this.mask = clipMask;
    }

    public function scrollTo(x,y) {
        trace("not implemented");
    }

    override public function get_numChildren() {
        return content.numChildren;
    }

    override public function addChild(child:DisplayObject):DisplayObject {
        return content.addChild(child);
    }

    override public function addChildAt(child:DisplayObject, index:Int):DisplayObject {
        return content.addChildAt(child, index);
    }

    override public function contains(child:DisplayObject):Bool {
        return content.contains(child);
    }

    override public function getChildAt(index:Int):DisplayObject {
        return content.getChildAt(index);
    }

    override public function getChildByName(name:String):DisplayObject {
        return content.getChildByName(name);
    }
    override public function getChildIndex(child:DisplayObject):Int {
        return content.getChildIndex(child);
    }
    override public function getObjectsUnderPoint(point:Point):Array<DisplayObject> {
        return content.getObjectsUnderPoint(point);
    }
    override public function removeChild(child:DisplayObject):DisplayObject {
        return content.removeChild(child);
    }
    override public function removeChildAt(index:Int):DisplayObject {
        return content.removeChildAt(index);
    }
    override public function removeChildren(beginIndex : Int = 0, endIndex : Int = 2147483647):Void {
        return content.removeChildren(beginIndex, endIndex);
    }
    override public function setChildIndex(child:DisplayObject, index:Int):Void {
        return content.setChildIndex(child,index);
    }
    override public function swapChildren(child1:DisplayObject, child2:DisplayObject):Void {
        return content.swapChildren(child1,child2);
    }
    override public function swapChildrenAt(index1:Int, index2:Int):Void {
        return content.swapChildrenAt(index1,index2);
    }
}
