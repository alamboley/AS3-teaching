package 
{
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.TextField;
	import objects.Ball;
	import objects.Player;
	
	/**
	 * ...
	 * @author Aymeric
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="800", height="600")]
	 
	public class Main extends Sprite 
	{
		private var playerLeft:Player;
		private var playerRight:Player;
		
		private var _ball:Ball;
		
		private var _scorePlayerLeft:TextField;
		private var _scorePlayerRight:TextField;
		
		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			playerLeft = new Player(true);
			addChild(playerLeft);
			
			playerRight = new Player(false);
			addChild(playerRight);
			
			_scorePlayerLeft = new TextField();
			_scorePlayerRight = new TextField();
			
			_scorePlayerLeft.text = _scorePlayerRight.text = "0";
			
			_scorePlayerLeft.x = 200;
			_scorePlayerRight.x = 600;
			
			_scorePlayerLeft.y = _scorePlayerRight.y = 50;
			
			addChild(_scorePlayerLeft);
			addChild(_scorePlayerRight);
			
			_addBall();
		}
		
		private function _addBall():void {
			
			_ball = new Ball(playerLeft, playerRight);
			_ball.x = (stage.stageWidth - _ball.width) / 2;
			_ball.y = (stage.stageHeight - _ball.height) / 2;
			addChild(_ball);
			
			_ball.addEventListener(GameEvent.GAME_WIN, _aPlayerWon);
		}
		
		private function _aPlayerWon(e:GameEvent):void 
		{
			_ball.removeEventListener(GameEvent.GAME_WIN, _aPlayerWon);
			removeChild(_ball);
			
			if (e.winner == 1)
				_scorePlayerLeft.text = String(uint(_scorePlayerLeft.text) + 1);
			else
				_scorePlayerRight.text = String(uint(_scorePlayerRight.text) + 1);
			
			_addBall();
		}
		
	}
	
}