package datastructures 
{
	/**
	 * ...
	 * @author Aymeric
	 */
	public class Cell 
	{
		public var type:uint;
		public var color:uint;
		
		private var _i:uint;
		private var _j:uint;
		
		
		public function Cell(i:uint, j:uint, type:uint, color:uint = 0) 
		{
			_i = i;
			_j = j;
			this.type = type;
			this.color = color;
		}
		
		public function get i():uint 
		{
			return _i;
		}
		
		public function get j():uint 
		{
			return _j;
		}
		
	}

}