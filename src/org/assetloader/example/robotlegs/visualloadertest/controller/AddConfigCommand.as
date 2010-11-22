package org.assetloader.example.robotlegs.visualloadertest.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class AddConfigCommand extends SignalCommand
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			assetloader.addConfig("assets/mixed-config.xml");
			
			signalCommandMap.mapSignal(assetloader.onConfigLoaded, ConfigLoadedCommand, true);
		}
	}
}
