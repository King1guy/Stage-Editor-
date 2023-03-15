package funkin.editors.ui;

import flixel.graphics.frames.FlxFrame;

class UIButton extends UISpliceSprite {
    public var callback:Void->Void = null;

    public var field:UIText;

    public override function new(x:Float, y:Float, text:String, callback:Void->Void, w:Int = 120, h:Int = 32) {
        super(x, y, w, h, 'editors/ui/button');
        this.callback = callback;
        members.push(field = new UIText(x, y, w, text));
        field.borderStyle = OUTLINE;
        field.borderColor = 0x88000000;
        field.borderSize = 1;
        field.alignment = CENTER;
        field.fieldWidth = w;
    }

    public override function resize(w:Int, h:Int) {
        super.resize(w, h);
        if (field != null)
            field.fieldWidth = w;
    }

    public override function onHovered() {
        super.onHovered();
        if (FlxG.mouse.justReleased && callback != null)
            callback();
    }

    public override function draw() {
        framesOffset = hovered ? (pressed ? 18 : 9) : 0;
        field.follow(this, x, (bHeight - field.height) / 2);
        super.draw();
    }
}