package org.assetloader.example.robotlegs.visualloadertest.controller 
{
	import org.assetloader.AssetLoader;
	import org.assetloader.base.AssetType;
	import org.assetloader.base.Param;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildCompleteSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildErrorSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildOpenSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class AddGroupCommand extends SignalCommand 
	{

		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void 
		{
			assetloader.setParam(Param.BASE, "http://www.matan.co.za/AssetLoader/testAssets/");
			assetloader.setParam(Param.PREVENT_CACHE, true);
			assetloader.numConnections = 1;
			
			var group : IAssetLoader = new AssetLoader(AssetId.SAMPLE_GROUP_01);
			group.numConnections = 1;
			
			assetloader.addLoader(group);
			
			group.addLazy(AssetId.SAMPLE_TXT, "sampleTXT.txt");
			group.addLazy(AssetId.SAMPLE_JSON, "sampleJSON.json");
			group.addLazy(AssetId.SAMPLE_XML, "sampleXML.xml");
			group.addLazy(AssetId.SAMPLE_CSS, "sampleCSS.css");
			group.addLazy(AssetId.SAMPLE_BINARY, "sampleZIP.zip", AssetType.AUTO, new Param(Param.WEIGHT, 3493));
			
			var soundLoader : ILoader = group.addLazy(AssetId.SAMPLE_SOUND, "sampleSOUND.mp3");
			soundLoader.setParam(Param.WEIGHT, 213007);
			signalCommandMap.mapSignal(soundLoader.onComplete, PlaySoundCommand);

			assetloader.addLazy(AssetId.SAMPLE_IMAGE, "sampleIMAGE.jpg", AssetType.AUTO, new Param(Param.WEIGHT, 328563));
			assetloader.addLazy(AssetId.SAMPLE_VIDEO, "sampleVIDEO.mp4", AssetType.AUTO, new Param(Param.ON_DEMAND, true), new Param(Param.WEIGHT, 10034673));
			assetloader.addLazy(AssetId.SAMPLE_SWF, "sampleSWF.swf", AssetType.AUTO, new Param(Param.WEIGHT, 941410));
						assetloader.addLazy(AssetId.SAMPLE_ERROR, "fileThatDoesNotExist.php");
			
			signalCommandMap.mapSignal(group.onChildOpen, OutputChildOpenSignalCommand);
			signalCommandMap.mapSignal(group.onChildError, OutputChildErrorSignalCommand);
			signalCommandMap.mapSignal(group.onChildComplete, OutputChildCompleteSignalCommand);
			
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}
