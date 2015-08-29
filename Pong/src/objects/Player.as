package objects {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Player extends Sprite 
	{
		private var _isPlayerLeft:Boolean;
		
		private var _bar:Sprite;
		
		private var _moveUp:Boolean = false;
		private var _moveDown:Boolean = false;
		
		private const _KEYBOARD_VELOCITY_Y:uint = 10;
		
		public function Player(isPlayerLeft:Boolean) 
		{
			super();
			
			_isPlayerLeft = isPlayerLeft;
			
			addEventListener(Event.ADDED_TO_STAGE, _addedToStage);
		}
		
		private function _addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStage);
			
			_bar = new Sprite();
			_bar.graphics.beginFill(0x000000);
			_bar.graphics.drawRect(0, 0, 20, 150);
			_bar.graphics.endFill();
			
			_bar.x = _isPlayerLeft ? 15 : stage.stageWidth - _bar.width - 15;
			_bar.y = (stage.stageHeight - _bar.height) / 2;
			addChild(_bar);
			
			addEventListener(Event.ENTER_FRAME, _update);
			
			if (!_isPlayerLeft) {
				stage.addEventListener(KeyboardEvent.KEY_DOWN, _keyboardEvent);
				stage.addEventListener(KeyboardEvent.KEY_UP, _keyboardEvent);
			}
		}
		
		private function _keyboardEvent(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.UP)
				_moveUp = e.type == "keyDown";
				
			else if (e.keyCode == Keyboard.DOWN)
				_moveDown = e.type == "keyDown";
		}
		
		private function _update(e:Event):void 
		{
			if (_isPlayerLeft)
				_bar.y = mouseY - _bar.height / 2;
				
			else {
				
				_bar.y += _moveUp ? -_KEYBOARD_VELOCITY_Y : _moveDown ? _KEYBOARD_VELOCITY_Y : 0;
				
				if (_bar.y < 0)
					_bar.y = 0;
					
				else if (_bar.y + _bar.height > stage.stageHeight)
					_bar.y = stage.stageHeight - _bar.height;
			}
		}
		
		public function destroy():void {
			
			removeEventListener(Event.ENTER_FRAME, _update);
			
			if (!_isPlayerLeft) {
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, _keyboardEvent);
				stage.removeEventListener(KeyboardEvent.KEY_UP, _keyboardEvent);
			}
		}
		
		public function get bar():Sprite 
		{
			return _bar;
		}
		
	}

}