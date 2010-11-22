package org.assetloader.example.robotlegs.visualloadertest.view
{
	import flash.display.Sprite;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class SWFAreaMediator extends Mediator
	{

		[Inject]
		public var view : SWFArea;

		[Inject]
		public var assetloader : IAssetLoader;

		override public function onRegister() : void
		{
			var loader : ILoader = assetloader.getLoader(AssetId.SAMPLE_SWF);
			view.statsMonitor.attach(loader);

			loader.onComplete.add(swfLoaded_handler);
		}

		protected function swfLoaded_handler(signal : LoaderSignal, swf : Sprite) : void
		{
			view.swf = swf;
		}
	}
}
