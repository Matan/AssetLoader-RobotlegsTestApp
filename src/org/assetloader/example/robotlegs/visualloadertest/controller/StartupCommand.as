package org.assetloader.example.robotlegs.visualloadertest.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildCompleteSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildErrorSignalCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.OutputChildOpenSignalCommand;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCommand extends SignalCommand
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			var addMode : int = 3;

			switch(addMode)
			{
				case 1:
					commandMap.execute(AddLazyCommand);
					break;
				case 2:
					commandMap.execute(AddGroupCommand);
					break;
				case 3:
					commandMap.execute(AddConfigCommand);
					break;
				default:
			}

			signalCommandMap.mapSignal(assetloader.onChildOpen, OutputChildOpenSignalCommand);			signalCommandMap.mapSignal(assetloader.onChildError, OutputChildErrorSignalCommand);
			signalCommandMap.mapSignal(assetloader.onChildComplete, OutputChildCompleteSignalCommand);
		}
	}
}
