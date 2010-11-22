package org.assetloader.example.robotlegs.visualloadertest.controller
{
	import org.assetloader.base.Param;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class AddLazyCommand extends SignalCommand
	{

		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			assetloader.setParam(Param.BASE, "http://www.matan.co.za/AssetLoader/testAssets/");
			assetloader.setParam(Param.PREVENT_CACHE, true);

			assetloader.addLazy(AssetId.SAMPLE_TXT, "sampleTXT.txt");
			assetloader.addLazy(AssetId.SAMPLE_JSON, "sampleJSON.json");
			assetloader.addLazy(AssetId.SAMPLE_XML, "sampleXML.xml");
			assetloader.addLazy(AssetId.SAMPLE_CSS, "sampleCSS.css");
			assetloader.addLazy(AssetId.SAMPLE_BINARY, "sampleZIP.zip");

			var soundLoader : ILoader = assetloader.addLazy(AssetId.SAMPLE_SOUND, "sampleSOUND.mp3");
			signalCommandMap.mapSignal(soundLoader.onComplete, PlaySoundCommand);

			assetloader.addLazy(AssetId.SAMPLE_IMAGE, "sampleIMAGE.jpg");
			assetloader.addLazy(AssetId.SAMPLE_VIDEO, "sampleVIDEO.mp4");
			assetloader.addLazy(AssetId.SAMPLE_SWF, "sampleSWF.swf");
			
			assetloader.addLazy(AssetId.SAMPLE_ERROR, "fileThatDoesNotExist.php");

			var videoLoader : ILoader = assetloader.getLoader(AssetId.SAMPLE_VIDEO);
			videoLoader.setParam(Param.ON_DEMAND, true);

			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}
