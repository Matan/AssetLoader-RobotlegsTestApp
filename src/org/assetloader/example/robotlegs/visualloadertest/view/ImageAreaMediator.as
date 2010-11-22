package org.assetloader.example.robotlegs.visualloadertest.view
{
	import flash.display.Bitmap;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.example.robotlegs.visualloadertest.model.AssetId;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class ImageAreaMediator extends Mediator
	{

		[Inject]
		public var view : ImageArea;

		[Inject]
		public var assetloader : IAssetLoader;

		override public function onRegister() : void
		{
			var loader : ILoader = assetloader.getLoader(AssetId.SAMPLE_IMAGE);
			view.statsMonitor.attach(loader);

			loader.onComplete.add(imageLoaded_handler);
		}

		protected function imageLoaded_handler(signal : LoaderSignal, bitmap : Bitmap) : void
		{
			view.bitmap = bitmap;
		}
	}
}
