package objects 
{
	import datastructures.Cell;
	import datastructures.Grid;
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Snake extends Sprite 
	{
		private var _gridTab:Vector.<Vector.<Cell>>;
		
		private var _body:Array = [];
		
		public var giveMeApple:Boolean = true;
		
		public function Snake(gridTab:Vector.<Vector.<Cell>>) 
		{
			super();
			
			_gridTab = gridTab;
			
			_body.push(_gridTab[4][0] = new Cell(4, 0, Grid.CASE_SNAKE_HEAD, 0x00CCFF));
			_body.push(_gridTab[3][0] = new Cell(3, 0, Grid.CASE_SNAKE, 0x00AAFF));
			_body.push(_gridTab[2][0] = new Cell(2, 0, Grid.CASE_SNAKE, 0x00AAFF));
			_body.push(_gridTab[1][0] = new Cell(1, 0, Grid.CASE_SNAKE, 0x00AAFF));
		}
		
		public function moveTo(direction:uint):void {
			
			var futureTail:Cell = _getNextCell(direction);
			
			if (futureTail.type == Grid.CASE_SNAKE) {
				
				dispatchEvent(new GameEvent(GameEvent.GAME_OVER));
				return;
			}
			
			var tail:Cell = _body[0];
			tail.type = Grid.CASE_SNAKE;
			tail.color = 0x00AAFF
			
			if (futureTail.type != Grid.CASE_APPLE) {
				var oldQueue:Cell = _body.pop();
				oldQueue.type = Grid.CASE_EMPTY;
				
			} else {
				
				giveMeApple = true;
			}
			
			futureTail.type = Grid.CASE_SNAKE_HEAD;
			futureTail.color = 0x00CCFF;
			_body.unshift(futureTail);
		}
		
		public function draw():void {
			
			graphics.clear();
			
			for (var i:uint = 0; i < 40; ++i) {
				for (var j:uint = 0; j < 30; ++j) {
					
					if (_gridTab[i][j].type == Grid.CASE_SNAKE || _gridTab[i][j].type == Grid.CASE_SNAKE_HEAD || _gridTab[i][j].type == Grid.CASE_APPLE) {
						graphics.beginFill(_gridTab[i][j].color);
						graphics.drawRect(i * Grid.CASE_SIZE, j * Grid.CASE_SIZE, Grid.CASE_SIZE, Grid.CASE_SIZE);
						
					}
				}
			}
			
			graphics.endFill();
		}
		
		private function _getNextCell(direction:uint):Cell {
			
			var tail:Cell = _body[0];
			var futureTail:Cell;
			
			if (direction == Keyboard.RIGHT) {
				
				futureTail = _gridTab[tail.i + 1 == _gridTab.length ? 0 : tail.i + 1][tail.j];
				
			} else if (direction == Keyboard.LEFT) {
				
				futureTail = _gridTab[tail.i - 1 == -1 ? _gridTab.length - 1 : tail.i - 1][tail.j];
				
			} else if (direction == Keyboard.DOWN) {
				
				futureTail = _gridTab[tail.i][tail.j + 1 == _gridTab[tail.i].length ? 0 : tail.j + 1];
				
			} else if (direction == Keyboard.UP) {
				
				futureTail = _gridTab[tail.i][tail.j - 1 == -1 ? _gridTab[tail.i].length - 1 : tail.j - 1];
			}
			
			return futureTail;
		}
		
	}

}