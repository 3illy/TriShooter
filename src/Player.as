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
		
		public var gravity:Number = 5;
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var grounded:Boolean = false;
		public var rightFacing:Boolean = true;
		
		public function Player()
		{
			
			graphic = player;
			player.originX = 15;
			
			setHitbox(30, 60);
			
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
			if (collide("wall", x, y +1))
			{
				grounded = true;
				y = y;
			}
			
			//let gravity take ove the player's yspeed
			else
			{
				grounded = false;
				y += gravity;
			}
			
			if (Input.check("Left"))
			{
				trace ("Left");
				x -= 4;
				if (rightFacing == true)
				{
					rightFacing = false;
					player.scaleX = -1;
				}
			}
			
			if (Input.check("Right"))
			{
				trace ("Right");
				x += 4;
				if (rightFacing == false)
				{
					rightFacing = true;
					player.scaleX = 1;
				}
				
			}
			
			if (Input.check("Down"))
			{
				trace ("Down");
			}
			
			if (Input.check("Jump") && grounded == true)
			{
				trace ("Jump");
				
			}
			
			if (Input.pressed("Shoot1"))
			{
				trace ("Shoot1");
			}
			
			if (Input.pressed("Shoot2"))
			{
				trace ("Shoot2");
			}
			
			if (Input.pressed("Shoot3"))
			{
				trace ("Shoot3");
			}
			
			
			
			
			
		}
	}
	
}