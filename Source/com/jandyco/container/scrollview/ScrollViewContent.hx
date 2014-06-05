package com.jandyco.container.scrollview;

import openfl.display.Sprite;

import openfl.geom.Rectangle;

class ScrollViewContent extends Sprite {
    public var scrollY (get,set) : Float;
    public var scrollX (get,set) : Float;

    public function new(width, height) {
        super();
        this.scrollRect = new Rectangle(0,0,width,height);
        this.graphics.beginFill(0x000000,0);
        this.graphics.drawRect(0,0,width,height);
    }

    public function toggleCacheAsBitmap() {
        this.cacheAsBitmap = !this.cacheAsBitmap;
    }

    public function get_scrollX() {
        return this.scrollRect.x;
    }

    public function get_scrollY() {
        return this.scrollRect.y;
    }

    public function set_scrollY (scrollY : Float)  {
        var rectangle = this.scrollRect;
        rectangle.y = scrollY;
        this.scrollRect = rectangle;
        return scrollY;
    }

    public function set_scrollX (scrollX : Float)  {
        var rectangle = this.scrollRect;
        rectangle.x = scrollX;
        this.scrollRect = rectangle;
        return scrollX;
    }
    
    public function scrollBy(deltaX : Float, deltaY : Float) {
        this.scrollX = this.scrollX - deltaX;
        this.scrollY = this.scrollY - deltaY;
    }

    public function outOfYBoundsBy(deltaY : Float) {
        var bottom = Math.max((scrollRect.bottom - deltaY) - this.height,0);
        var top = Math.min(scrollRect.top - deltaY,0);
        if (top < 0) { 
            return top;
        } else {
            return bottom;
        }
    }
}
