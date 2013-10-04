package 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	 
	public class Player extends Entity
	{
		[Embed(source = 'assets/SPRITESHEET_PLAYER.png')] private const PLAYER:Class;
		public var player:Spritemap  = new Spritemap(PLAYER, 32, 32);
		
		public var speed:Number = 4;
		public var jumpSpeed:Number = 8;
		public var gravity:Number = 1;
		public var fallSpeed:Number = 0;
		public var moving:Boolean = false;
		public var drag:Number = .85;
		public var jumpDrag:Number = .90;
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var xPos:Number = 0;
		public var yPos:Number = 0;
		public var grounded:Boolean = false;
		public var canJump:Boolean = false;
		public var jumping:Boolean = false;
		public var rightFacing:Boolean = true;
		public var goingRight:Boolean = false;
		public var goingLeft:Boolean = false;
		public var shotOriginX:Number = 0;
		public var shotOriginY:Number = 0;
		
		public function Player()
		{
			
			
			
			player.add("stand", [0, 1], 2, true);
			player.add("walk", [2, 3, 4, 5, 6, 7], 12, true);
			
			graphic = player;
			player.originX = 15;
			
			x = 25
			
			setHitbox(18, 32);
			
			Input.define("Jump", Key.W, Key.SPACE);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Down", Key.S, Key.DOWN);
			Input.define("Shoot1", Key.J, Key.C);
			Input.define("Shoot2", Key.K, Key.X);
			Input.define("Shoot3", Key.L, Key.Z);
		}
		
		override public function update():void 
		{
			//check if the player is grounded
			if (collide("wall", x, y))
			{
				grounded = true;
				jumping = false;
				canJump = true;
				fallSpeed = gravity;
				y = y;
			}
			
			//let gravity take ove the player's yspeed
			if (!collide("wall", x, y +1) && jumping == false)
			{
				grounded = false;
				
				if (fallSpeed < 6)
				{fallSpeed += .3;}
				
				y += fallSpeed;
			}
			
			if (Input.check("Left"))
			{
				moving = false;
				goingLeft = true;
				goingRight = false;
				x -= speed;
				xSpeed = speed;
				player.play("walk");
				if (rightFacing == true)
				{
					rightFacing = false;
					player.scaleX = -1;
				}
				
			}
			
			if (Input.check("Right"))
			{
				moving = false;
				goingRight = true;
				goingLeft = false;
				x += speed;
				xSpeed = speed;
				player.play("walk");
				if (rightFacing == false)
				{
					rightFacing = true;
					player.scaleX = 1;
				}
				
			}
			//this is where drag is implimented on the player
			if (Input.released("Left") || Input.released("Right"))
			{moving = true; }
			
			if (moving == true)
			{
				xSpeed *= drag;
				
				if (goingLeft == true)
				{x -= xSpeed; }
				
				if (goingRight == true)
				{x += xSpeed;}
				
				
				if (xSpeed < 0.8)
				{
					moving = false;
					goingLeft = false;
					goingRight = false;
				}
				
			}
			
			if (Input.check("Down"))
			{
				trace ("Down");
			}
			
			if (Input.check("Jump") && canJump == true)
			{
				if (grounded == true)
				{ySpeed = jumpSpeed; }
				
				ySpeed *= jumpDrag;
				y -= ySpeed;
				jumping = true;
				grounded = false;
				
			}
			
			if (Input.released("Jump") || ySpeed < 1.5)
			{
			canJump = false;
			jumping = false; 
			}
			
			//sets the shot origin to the correcto location
			shotOriginX = x + 8;
			shotOriginY = y + 16;
			
			if (Input.pressed("Shoot1"))
			{
				FP.world.add(new Projectile("projectile1", shotOriginX, shotOriginY));
			}
			
			
			
			//idle animation
			if (goingRight == false && goingLeft == false)
			{
				player.play("stand");
			}
			
			//moves the camera with the player
			
			FP.screen.x = -x;
			FP.screen.y = -y +220;
			
			
			
			
			
			
			
			
			
			
		}
	}
	
}