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
		public function Menu()
		{
			add(new Player());
			
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
		}
	}
	
}