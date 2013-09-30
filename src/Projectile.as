package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Billy Tremaine
	 */
	public class  Projectile extends Entity
	{
		public var sVerticalDrag:Number = 85;
		public var sGravity:Number = 1;
		public var sXSpeed:Number = 0;
		public var sYSpeed:Number = 0;
		public var sXPos:Number = 0;
		public var sYPos:Number = 0;
		public var sType:String;
		public var sTime:Number = 0;
		public var sStartTime:Boolean = false;
		public var sShot1Used:Boolean = false;
		public var sShot2Used:Boolean = false;
		public var sShot3Used:Boolean = false;
		
		
		public function Projectile(ProjectileType:String, xPos:Number, yPos:Number)
		{
			setHitbox(10, 10);
			type = ProjectileType;
			
			Input.define("Shoot1", Key.J, Key.C);
			Input.define("Shoot2", Key.K, Key.X);
			Input.define("Shoot3", Key.L, Key.Z);
			
			if (type == "projectile1" && sShot1Used == false)
			{
				sShot1Used = true;
			}
			
			if (type == "projectile2" && sShot2Used == false)
			{
				sShot2Used = true;
			}
			
			if (type == "projectile3" && sShot3Used == false)
			{
				sShot3Used = true;
			}
		}
		
		override public function update():void
		{
			if (Input.pressed("Shoot1"))
			{
				sShot1Used = true;
			}
			
			if (Input.pressed("Shoot2"))
			{
				sShot2Used = true;
			}
			
			if (Input.pressed("Shoot3"))
			{
				sShot3Used = true;
			}
			
		}
	}
	
}