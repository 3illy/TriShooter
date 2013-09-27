package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class Main extends Engine 
	{
		
		public function Main()
		{
			super(800, 600, 60, false);
			FP.world = new Menu;
		}
		
		override public function init():void
		{
			
		}
	}
	
}