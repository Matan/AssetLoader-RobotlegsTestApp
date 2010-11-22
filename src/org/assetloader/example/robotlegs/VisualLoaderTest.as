package  
org.assetloader.example.robotlegs{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import org.assetloader.example.robotlegs.visualloadertest.VisualLoaderTestContext;

	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="900", height="500")]

	/**
	 * @author Matan Uberstein
	 */
	public class VisualLoaderTest extends Sprite 
	{
		protected var _context : VisualLoaderTestContext;

		public function VisualLoaderTest()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_context = new VisualLoaderTestContext(this);
		}
	}
}
