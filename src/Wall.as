package 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class Wall extends Entity 
	{
		public function Wall(xLoc, yLoc)
		{
			setHitbox(16, 12);
			type = "wall";
			
			//gets a position
			x = xLoc
			y = yLoc
			
			//is how big it is
			width = 16;
			height = 12;
		}
	}
	
}