package 
{
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
		[Embed(source = 'assets/player.png')] private const PLAYER:Class;
		public var player:Image  = new Image(PLAYER);
		
		public var speed:Number = 4;
		public var jumpSpeed:Number = 18;
		public var gravity:Number = 1;
		public var fallSpeed:Number = 0;
		public var moving:Boolean = false;
		public var drag:Number = .85;
		public var jumpDrag:Number = .90;
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
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
			
			graphic = player;
			player.originX = 15;
			
			setHitbox(30, 60);
			
			Input.define("Jump", Key.W, Key.SPACE);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Down", Key.S, Key.DOWN);
		}
		
		override public function update():void 
		{
			//check if the player is grounded
			if (collide("wall", x, y +1))
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
				
				if (fallSpeed < 8)
				{fallSpeed += .5;}
				
				y += fallSpeed;
			}
			
			if (Input.check("Left"))
			{
				moving = false;
				goingLeft = true;
				goingRight = false;
				x -= speed;
				xSpeed = speed;
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
			shotOriginX = x + 15;
			shotOriginY = y + 15;
			
			
			
			
			
			
		}
	}
	
}