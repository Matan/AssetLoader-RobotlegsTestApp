package org.assetloader.example.robotlegs.visualloadertest.controller.output
{
	import org.assetloader.core.ILoadStats;
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.LoaderSignal;

	/**
	 * @author Matan Uberstein
	 */
	public class OutputChildOpenSignalCommand extends BaseOutputCommand
	{

		[Inject]
		public var signal : LoaderSignal;

		[Inject]
		public var child : ILoader;

		override public function execute() : void
		{
			_color = "#0099FF";
			_size = "-2";
			
			var stats : ILoadStats = child.stats;

			append(bigger("[" + signal.loader.id + "]", 3));			append("\t" + bigger("onChildOpen", 2) + ": " + child.id);
			append("\t\tLatency: " + Math.floor(stats.latency) + " ms");

			addDividerLine();
			
			super.execute();
		}
	}
}
