package com.jandyco.util;

import flash.geom.Point;
import flash.display.DisplayObject;

/**
 * Utilities for dealing displayObjects
 */
class DisplayObjectUtil {

    /**
     * Move the displayObject to the provided locations
     * @param displayObject the displayObject to move
     * @param x The x position to move to
     * @param y The y position to move to
     */
    public static function setPosition(displayObject:DisplayObject, x:Float, y:Float) {
        displayObject.x = x;
        displayObject.y = y;
    }

    /**
     * Move a displayObject by the provided deltas
     * @param displayObject the displayObject to move
     * @param x The x delta to move by
     * @param y The y delta to move by
     */
    public static function movePosition(displayObject:DisplayObject, deltaX:Float, deltaY:Float) {
        displayObject.x += deltaX;
        displayObject.y += deltaY;
    }

    /**
     * Get the displayObjects position as a flash.geom.Point
     * @param displayObject The displayObject to get the position of
     * @return flash.geom.Point representing the position of the displayObject
     */
    public static function getPosition(displayObject:DisplayObject) {
        return new Point(displayObject.x, displayObject.y);
    }

    public static function setCenterX(displayObject:DisplayObject, x:Float) {
        displayObject.x = x - displayObject.width/2;
    }

    public static function setCenterY(displayObject:DisplayObject, y:Float) {
        displayObject.y = y - displayObject.height/2;
    }

    public static function setCenter(displayObject:DisplayObject, x:Float, y:Float) {
        setCenterX(displayObject,x);
        setCenterY(displayObject,y);
    }

    public static function setRight(displayObject:DisplayObject, right:Float) {
        displayObject.x = right - displayObject.width;
    }

}
