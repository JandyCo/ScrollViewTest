package com.jandyco.container.scrollview;

import openfl.events.MouseEvent;

import motion.Actuate;

import com.jandyco.container.ScrollView;

class BasicScrollBehavior {
    private var scrollView : ScrollView;
    private var lastY : Float = 0;

    public function new (scrollView : ScrollView, ?style : Dynamic) {
        this.scrollView = scrollView;
        this.scrollView.addEventListener(MouseEvent.MOUSE_DOWN, down);
    }

    private function up(event : MouseEvent) {  
        this.scrollView.removeEventListener(MouseEvent.MOUSE_OUT, out);
        this.scrollView.removeEventListener(MouseEvent.MOUSE_UP, up);
        this.scrollView.removeEventListener(MouseEvent.MOUSE_MOVE, move);
    }

    private function out(event : MouseEvent) { 
        if ((event.stageX > scrollView.x + scrollView.maxWidth || event.stageX < scrollView.x) &&
                (event.stageY > scrollView.y + scrollView.maxHeight || event.stageY < scrollView.y)) {
            up(event); 
        }
    }
    private function down(event : MouseEvent) { 
        lastY = this.scrollView.mouseY;
        this.scrollView.addEventListener(MouseEvent.MOUSE_MOVE, move);
        this.scrollView.addEventListener(MouseEvent.MOUSE_OUT, out);
        this.scrollView.addEventListener(MouseEvent.MOUSE_UP, up);
    }
    
    private function move(event : MouseEvent) { 
        var deltaY = this.scrollView.mouseY - lastY;
        var outOfYBoundsBy = scrollView.content.outOfYBoundsBy(deltaY);
        scrollView.content.scrollBy(0,deltaY + outOfYBoundsBy);
        lastY = this.scrollView.mouseY;
    }
}
