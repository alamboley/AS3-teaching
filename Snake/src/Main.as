package 
{
	import datastructures.Cell;
	import datastructures.Grid;
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import objects.Snake;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Main extends Sprite 
	{		
		private var _direction:uint = Keyboard.RIGHT;
		
		private var _grid:Grid;
		private var _snake:Snake;
		private var _timer:Timer;
		
		public function Main() 
		{
			_grid = new Grid();
			
			_snake = new Snake(_grid.gridTab);
			addChild(_snake);
			
			_snake.addEventListener(GameEvent.GAME_OVER, _gameOver);
			
			_timer = new Timer(100);
			_timer.addEventListener(TimerEvent.TIMER, _onTick);
			_timer.start();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, _keyDown);
		}
		
		private function _gameOver(gEvt:GameEvent):void 
		{
			trace("game over");
			
			_timer.stop();
		}
		
		private function _onTick(tEvt:TimerEvent):void 
		{
			_snake.moveTo(_direction);
			
			_snake.draw();
			
			if (_snake.giveMeApple) {
				
				var apple:Cell = _grid.getRandomEmptyCell();
				
				apple.type = Grid.CASE_APPLE;
				apple.color = 0xFF0000;
				
				_snake.giveMeApple = false;
			}
		}
		
		private function _keyDown(kEvt:KeyboardEvent):void 
		{
			
			if (kEvt.keyCode == Keyboard.UP && _direction != Keyboard.DOWN)
				_direction = kEvt.keyCode;
				
			else if (kEvt.keyCode == Keyboard.DOWN && _direction != Keyboard.UP)
				_direction = kEvt.keyCode;
				
			else if (kEvt.keyCode == Keyboard.LEFT && _direction != Keyboard.RIGHT)
				_direction = kEvt.keyCode;
				
			else if (kEvt.keyCode == Keyboard.RIGHT && _direction != Keyboard.LEFT)
				_direction = kEvt.keyCode;
		}
		
	}
	
}