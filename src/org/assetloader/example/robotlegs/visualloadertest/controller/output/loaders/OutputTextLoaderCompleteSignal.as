package org.assetloader.example.robotlegs.visualloadertest.controller.output.loaders
{
	import org.assetloader.example.robotlegs.visualloadertest.controller.output.BaseOutputCommand;
	import org.assetloader.signals.LoaderSignal;

	/**
	 * @author Matan Uberstein
	 */
	public class OutputTextLoaderCompleteSignal extends BaseOutputCommand
	{
		[Inject]
		public var signal : LoaderSignal;

		[Inject]
		public var data : String;

		override public function execute() : void
		{
			append(data);
		}
	}
}
