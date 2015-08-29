package objects 
{
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Ball extends Sprite 
	{
		private const _VELOCITY_X:uint = 10;
		private var _VELOCITY_Y:int = 0;
		
		private var _playerLeft:Player;
		private var _playerRight:Player;
		
		private var _movingToLeft:Boolean = true;
		private var _movingToTop:Boolean = true;
		
		public function Ball(playerLeft:Player, playerRight:Player)
		{
			super();
			
			_playerLeft = playerLeft;
			_playerRight = playerRight;
			
			
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(0, 0, 15);
			graphics.endFill();
			
			addEventListener(Event.ENTER_FRAME, _update);
		}
		
		private function _update(e:Event):void 
		{
			
			x += _movingToLeft ? - _VELOCITY_X : _VELOCITY_X;
			y += _movingToTop ? _VELOCITY_Y : - _VELOCITY_Y;
			
			if (_movingToLeft) {
				
				if (hitTestObject(_playerLeft)) {
					
					_movingToLeft = false;
					
					_changeYBall(_playerLeft);
				}
					
			} else {
				
				if (hitTestObject(_playerRight)) {
					
					_movingToLeft = true;
					
					_changeYBall(_playerRight);
				}
			}
			
			if (_movingToTop && y > stage.stageHeight)
				_movingToTop = false;
			
			else if (!_movingToTop && y < 0)
				_movingToTop = true;
			
			if (x < 0) {
				
				dispatchEvent(new GameEvent(GameEvent.GAME_WIN, 2));
				_destroy();
				
			} else if (x > stage.stageWidth) {
				
				dispatchEvent(new GameEvent(GameEvent.GAME_WIN, 1));
				_destroy();
			}
		}
		
		private function _changeYBall(player:Player):void 
		{
			if (y > player.bar.y + player.height * 0.75)
				_VELOCITY_Y = 10;
				
			else if (y < player.bar.y + player.height * 0.25) {
				_VELOCITY_Y = 10;
				_movingToTop = false;
				
			} else
				_VELOCITY_Y = 0;
		}
		
		private function _destroy():void {
			
			removeEventListener(Event.ENTER_FRAME, _update);
		}
		
	}

}