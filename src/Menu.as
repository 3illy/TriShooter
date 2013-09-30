package 
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class Menu extends World
	{
		public var playerAlive:Boolean = true;
		public var canFire:Boolean = true;
		
		public function Menu()
		{
			add(new Player());
			
			Input.define("Shoot1", Key.J, Key.C);
			Input.define("Shoot2", Key.K, Key.X);
			Input.define("Shoot3", Key.L, Key.Z);
			
			var i:int;
			for (i = 0; i < 800; i += 16)
			{
				if (i < 400)
				{
				add(new Wall(i, 588));
				}
			}
		}
		
		override public function update():void
		{
			//makes sure to call the updates in the Entities
			super.update();
			
			//gets the variables from this instance of the player class.
			var player:Player = new Player();
			
			if (Input.pressed(Key.P))
			{
				trace ("pause");
				//pause the game
			}
			
			if (Input.pressed(Key.O))
			{
				trace ("options");
				//open options
			}
			
			
			
			if (Input.pressed("Shoot1") && canFire == true)
			{
				add(new Projectile("projectile1", player.shotOriginX, player.shotOriginY));
				var projectile1:Projectile = new Projectile("projectile1", player.shotOriginX, player.shotOriginY);
				
				canFire = false;
			}
			
			if (Input.pressed("Shoot2") && canFire == true)
			{
				add(new Projectile("projectile2", player.shotOriginX, player.shotOriginY));
				var projectile2:Projectile = new Projectile("projectile2", player.shotOriginX, player.shotOriginY);
				
				canFire = false;
			}
			
			if (Input.pressed("Shoot3") && canFire == true)
			{
				add(new Projectile("projectile3", player.shotOriginX, player.shotOriginY));
				var projectile3:Projectile = new Projectile("projectile3", player.shotOriginX, player.shotOriginY);
				
				canFire = false;
			}
			
		}
	}
	
}