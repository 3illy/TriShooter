package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Screen;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class Menu extends World
	{
		public var playerAlive:Boolean = true;
		public var canFire:Boolean = true;
		public var PAUSED:Boolean = false;
		public var screenX:Number = 0;
		public var screenY:Number = 0;
		
		public function Menu()
		{
			add(new Player());
			
			
			//Input.define("Shoot1", Key.J, Key.C);
			//Input.define("Shoot2", Key.K, Key.X);
			//Input.define("Shoot3", Key.L, Key.Z);
			
			var i:int;
			for (i = 0; i < 800; i += 16)
			{
				if (i < 400)
				{
				add(new Wall(i, 120));
				add(new Wall(i+120, 240));
				}
			}
		}
		
		override public function update():void
		{
			//makes sure to call the updates in the Entities
			if (PAUSED == false)
			{ super.update(); }
			
			//gets the variables from this instance of the player class.
			var player:Player = new Player();
			
			
			
			
			
			
			if (Input.pressed(Key.P) && PAUSED == false)
			{
				PAUSED = true;
				//pause the game
			}
			else
			{
				PAUSED = false;
			}
			
			if (Input.pressed(Key.O))
			{
				trace ("options");
				//open options
			}
			
			
			/*
			if (Input.pressed("Shoot1") && canFire == true && PAUSED == false)
			{
				add(new Projectile());
				var projectile1:Projectile = new Projectile();
				
				canFire = false;
			}
			
			if (Input.pressed("Shoot2") && canFire == true && PAUSED == false)
			{
				add(new Projectile());
				var projectile2:Projectile = new Projectile();
				
				canFire = false;
			}
			
			if (Input.pressed("Shoot3") && canFire == true && PAUSED == false)
			{
				add(new Projectile());
				var projectile3:Projectile = new Projectile();
				
				canFire = false;
			}
			*/
			
			
		}
	}
	
}