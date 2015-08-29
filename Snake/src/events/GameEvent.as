package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class GameEvent extends Event 
	{
		static public const GAME_OVER:String = "GAME_OVER";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}