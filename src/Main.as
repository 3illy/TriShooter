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
			super(800, 800, 60, false);
			FP.world = new Menu;
			FP.screen.scale = 2;
		}
		
		override public function init():void
		{
			
		}
	}
	
}