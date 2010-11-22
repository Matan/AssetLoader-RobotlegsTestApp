package org.assetloader.example.robotlegs.visualloadertest.view
{
	import org.assetloader.core.ILoadStats;

	import mu.utils.ToStr;

	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author Matan Uberstein
	 */
	public class CanvasMediator extends Mediator
	{

		[Inject]
		public var view : Canvas;

		[Inject]
		public var loader : IAssetLoader;

		override public function onRegister() : void
		{
			loader.onProgress.add(loaderProgress_handler);

			view.init();

			eventMap.mapListener(view.startBtn, MouseEvent.CLICK, startClick_handler, MouseEvent);
			eventMap.mapListener(view.stopBtn, MouseEvent.CLICK, stopClick_handler, MouseEvent);
			eventMap.mapListener(view.destroyBtn, MouseEvent.CLICK, destroyClick_handler, MouseEvent);
		}

		protected function loaderProgress_handler(signal : LoaderSignal) : void
		{
			var stats : ILoadStats = loader.stats;

			view.setOverallProgress(stats.progress);
			view.statsText = new ToStr(stats).toString();
		}

		protected function startClick_handler(event : MouseEvent) : void
		{
			loader.start();
		}

		protected function stopClick_handler(event : MouseEvent) : void
		{
			loader.stop();
		}

		protected function destroyClick_handler(event : MouseEvent) : void
		{
			loader.destroy();
		}
	}
}
