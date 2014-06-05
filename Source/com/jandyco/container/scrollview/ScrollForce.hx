package com.jandyco.container.scrollview;

class ScrollForce {
    public var x(get,null):Float = 0;
    public var y(get,null):Float = 0;
    public var maxX:Float = 100;
    public var maxY:Float = 100;
    public var minX:Float = .1;
    public var minY:Float = .1;
    
    var isHScrollEnabled = false;
    var isVScrollEnabled = true;

    public function new(?x=0.0,?y=0.0, ?isHScrollEnabled = false, ?isVScrollEnabled = true) {
        this.x = x;
        this.y = y;
        this.isHScrollEnabled = isHScrollEnabled;
        this.isVScrollEnabled = isVScrollEnabled;
    }

    public function setForce(deltaX:Float,deltaY:Float) {
        x = isHScrollEnabled ? deltaX : 0;
        y = isVScrollEnabled ? deltaY : 0;

        var tempX:Float = x;
        var tempY:Float = y;

        tempX  = (-minX < tempX && tempX < minX) ? 0 : tempX;
        tempY  = (-minY < tempY && tempY < minY) ? 0 : tempY;
        tempX = tempX < - maxX ? -maxX : tempX;
        tempX = maxX < tempX ? maxX : tempX;
        tempY = maxY < tempY ? maxY : tempY;
        tempY = tempY < - maxY ? -maxY : tempY;

        x = tempX;
        y = tempY;
    }

    public function clearForce() {
        x =  0;
        y = 0;
    }

    public function get_x() {
        return x;
    }

    public function get_y() {
        return y;
    }

    public function isScrolling() :Bool {
        return x != 0 || y != 0;
    }
}
