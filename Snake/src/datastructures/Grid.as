package datastructures 
{
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Grid 
	{
		static public const CASE_SIZE:uint = 20;
		
		static public const CASE_EMPTY:uint = 0;
		static public const CASE_SNAKE:uint = 1;
		static public const CASE_SNAKE_HEAD:uint = 2;
		static public const CASE_APPLE:uint = 3;
		
		private var _gridTab:Vector.<Vector.<Cell>> = new Vector.<Vector.<Cell>>();
		
		public function Grid() 
		{
			for (var i:uint = 0; i < 40; ++i) {
				
				_gridTab[i] = new Vector.<Cell>();
				
				for (var j:uint = 0; j < 30; ++j) {
					
					_gridTab[i][j] = new Cell(i, j, CASE_EMPTY);
				}
			}
		}
		
		public function get gridTab():Vector.<Vector.<Cell>> {
			
			return _gridTab;
		}
		
		public function getRandomEmptyCell():Cell {
			
			var cellFinded:Boolean = false;
			
			var emptyCell:Cell;
			
			while (!cellFinded) {
				
				emptyCell = _gridTab[randomInt(0, 39)][randomInt(0, 29)];
				
				if (emptyCell.type == CASE_EMPTY)
					cellFinded = true;
			}
			
			return emptyCell;
		}
		
		public function randomInt(min:int, max:int):int {
			
			return Math.floor(Math.random() * (1 + max - min)) + min;
		}
		
	}
}