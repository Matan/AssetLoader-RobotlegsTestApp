package org.assetloader.example.robotlegs.visualloadertest.controller
{
	import org.assetloader.example.robotlegs.visualloadertest.view.Canvas;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCompleteCommand extends Command
	{
		override public function execute() : void
		{
			contextView.addChild(new Canvas());
		}
	}
}
