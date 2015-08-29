package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class GameEvent extends Event 
	{
		static public const GAME_WIN:String = "GAME_WIN";
		
		private var _winner:uint = 0;
		
		public function GameEvent(type:String, winner:uint, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
			_winner = winner;
		}
		
		public function get winner():uint {
			
			return _winner;
		}
		
	}

}