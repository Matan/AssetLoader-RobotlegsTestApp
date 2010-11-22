package org.assetloader.example.robotlegs.visualloadertest.controller.output
{
	import org.assetloader.core.ILoadStats;
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.LoaderSignal;

	/**
	 * @author Matan Uberstein
	 */
	public class OutputChildCompleteSignalCommand extends BaseOutputCommand
	{

		[Inject]
		public var signal : LoaderSignal;

		[Inject]
		public var child : ILoader;

		override public function execute() : void
		{
			_color = "#00CC66";
			
			var stats : ILoadStats = child.stats;

			append(bigger("[" + signal.loader.id + "]", 3));
			append("\t" + bigger("onChildComplete", 2) + ": " + child.id);
			append("\t\tTotal Time: " + Math.floor(stats.totalTime) + " ms");
			
			addDividerLine();
			
			super.execute();
		}
	}
}
