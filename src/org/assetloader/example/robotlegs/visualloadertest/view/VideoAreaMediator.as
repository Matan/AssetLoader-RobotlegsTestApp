package org.assetloader.example.robotlegs.visualloadertest.view
{
	import flash.events.MouseEvent;
	import flash.net.NetStream;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.assetloader.loaders.VideoLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class VideoAreaMediator extends Mediator
	{

		[Inject]
		public var view : VideoArea;

		[Inject]
		public var assetloader : IAssetLoader;

		override public function onRegister() : void
		{
			var loader : VideoLoader = VideoLoader(assetloader.getLoader(AssetId.SAMPLE_VIDEO));
			view.statsMonitor.attach(loader);

			loader.onReady.add(videoReady_handler);
			eventMap.mapListener(view.startBtn, MouseEvent.CLICK, startClick_handler, MouseEvent);
		}

		protected function videoReady_handler(signal : LoaderSignal, netStream : NetStream) : void
		{
			view.netStream = netStream;
		}

		protected function startClick_handler(event : MouseEvent) : void
		{
			assetloader.startLoader(AssetId.SAMPLE_VIDEO);
			view.removeChild(view.startBtn);
		}
	}
}
