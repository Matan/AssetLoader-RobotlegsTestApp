package org.assetloader.example.robotlegs.visualloadertest 
{
	import flash.display.DisplayObjectContainer;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.example.robotlegs.visualloadertest.controller.StartupCommand;
	import org.assetloader.example.robotlegs.visualloadertest.controller.StartupCompleteCommand;
	import org.assetloader.example.robotlegs.visualloadertest.model.ConsoleModel;
	import org.assetloader.example.robotlegs.visualloadertest.view.Canvas;
	import org.assetloader.example.robotlegs.visualloadertest.view.CanvasMediator;
	import org.assetloader.example.robotlegs.visualloadertest.view.Console;
	import org.assetloader.example.robotlegs.visualloadertest.view.ConsoleMediator;
	import org.assetloader.example.robotlegs.visualloadertest.view.ImageArea;
	import org.assetloader.example.robotlegs.visualloadertest.view.ImageAreaMediator;
	import org.assetloader.example.robotlegs.visualloadertest.view.SWFArea;
	import org.assetloader.example.robotlegs.visualloadertest.view.SWFAreaMediator;
	import org.assetloader.example.robotlegs.visualloadertest.view.VideoArea;
	import org.assetloader.example.robotlegs.visualloadertest.view.VideoAreaMediator;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;

	/**
	 * @author Matan Uberstein
	 */
	public class VisualLoaderTestContext extends SignalContext 
	{
		public function VisualLoaderTestContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void 
		{
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);
			
			injector.mapSingletonOf(IAssetLoader, AssetLoader);
						injector.mapSingleton(ConsoleModel);
						mediatorMap.mapView(Canvas, CanvasMediator);
						mediatorMap.mapView(Console, ConsoleMediator);			mediatorMap.mapView(ImageArea, ImageAreaMediator);
			mediatorMap.mapView(VideoArea, VideoAreaMediator);			mediatorMap.mapView(SWFArea, SWFAreaMediator);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}
