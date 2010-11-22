package org.assetloader.example.robotlegs.visualloadertest.controller.output
{
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.ErrorSignal;

	/**
	 * @author Matan Uberstein
	 */
	public class OutputChildErrorSignalCommand extends BaseOutputCommand
	{

		[Inject]
		public var signal : ErrorSignal;

		[Inject]
		public var child : ILoader;
		
		override public function execute() : void
		{
			_color = "#FF3300";
			_size = "+2";
			
			append(bigger("[" + signal.loader.id + "]", 3));
			append("\t" + bigger("onChildError", 2) + ": " + child.id);
			append("\t\t[Type: " + signal.type + "] | [Message: " + signal.message + "]");

			addDividerLine();
			
			super.execute();
		}
	}
}
