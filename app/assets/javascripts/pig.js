(function (window) {
    function Pig(imgPig, x_start, x_end) {
        this.initialize(imgPig, x_start, x_end);
    }
    Pig.prototype = new createjs.Sprite();

    // public properties:
    Pig.prototype.bounds = 0;
    Pig.prototype.hit = 0;
    Pig.prototype.alive = true;

    // constructor:
    Pig.prototype.Sprite_initialize = Pig.prototype.initialize; //unique to avoid overiding base class


   
    Pig.prototype.initialize = function (imgPig) {
      var localSpriteSheet = new createjs.SpriteSheet({
        images: [imgPig], //image to use
        frames: { width:234, height:150, regX:0, regY: 0 },
        animations: {
            walk: [0, 5, "walk", 0.6]            
        }
      });

      createjs.SpriteSheetUtils.addFlippedFrames(localSpriteSheet, true, false, false);

     
      this.Sprite_initialize(localSpriteSheet);
      
      this.regX = this.spriteSheet.frameWidth / 2 | 0;
      this.regY = this.spriteSheet.frameHeight / 2 | 0;

      
      // start playing the first sequence:
      this.gotoAndPlay("walk_h");     //animate
      
      this.name = "Runny";

      // 1 = right & -1 = left
      this.direction = 1;
      // velocity
      this.vX = 6;
      this.vY = 0;
      // starting directly at the first frame of the walk_h sequence
      this.currentFrame = 5;

    }

    Pig.prototype.tick = function () {
        if (this.x >= screen_width ) {
            this.direction = -1;
            this.x = screen_width - 234;
            this.gotoAndPlay("walk")
        }

        if (this.x < 0) {
            this.direction = 1;
            this.x = 234 ;
            this.gotoAndPlay("walk_h");
        }

        // Moving the sprite based on the direction & the speed
        if (this.direction == 1) {
            this.x += this.vX;
        }
        else {
            this.x -= this.vX;
        }

    }

    window.Pig = Pig;
} (window));