package org.assetloader.example.robotlegs.visualloadertest.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildCompleteSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildErrorSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildOpenSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class ConfigLoadedCommand extends SignalCommand
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			var group1 : IAssetLoader = IAssetLoader(assetloader.getLoader(AssetId.SAMPLE_GROUP_01));
			
			signalCommandMap.mapSignal(group1.onChildOpen, OutputChildOpenSignalCommand);			signalCommandMap.mapSignal(group1.onChildError, OutputChildErrorSignalCommand);
			signalCommandMap.mapSignal(group1.onChildComplete, OutputChildCompleteSignalCommand);

			signalCommandMap.mapSignal(group1.getLoader(AssetId.SAMPLE_SOUND).onComplete, PlaySoundCommand);
			
			var group2 : IAssetLoader = IAssetLoader(group1.getLoader(AssetId.SAMPLE_GROUP_02));
			
			signalCommandMap.mapSignal(group2.onChildOpen, OutputChildOpenSignalCommand);
			signalCommandMap.mapSignal(group2.onChildError, OutputChildErrorSignalCommand);
			signalCommandMap.mapSignal(group2.onChildComplete, OutputChildCompleteSignalCommand);

			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}
