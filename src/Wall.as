package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class Wall extends Entity 
	{
		[Embed(source = 'assets/wall.png')] private const WALL:Class;
		
		
		public function Wall(xLoc:Number, yLoc:Number)
		{
			
			graphic = new Image(WALL);
			
			setHitbox(16, 12);
			type = "wall";
			
			//gets a position
			x = xLoc;
			y = yLoc;
			
		}
	}
	
}