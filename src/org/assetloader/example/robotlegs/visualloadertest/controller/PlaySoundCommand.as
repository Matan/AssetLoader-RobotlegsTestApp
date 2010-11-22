package org.assetloader.example.robotlegs.visualloadertest.controller 
{
	import org.assetloader.loaders.SoundLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Command;

	import flash.media.SoundTransform;

	/**
	 * @author Matan Uberstein
	 */
	public class PlaySoundCommand extends Command 
	{
		
		[Inject]
		public var signal : LoaderSignal;

		override public function execute() : void 
		{
			var loader : SoundLoader = SoundLoader(signal.loader);
			loader.sound.play(0, 1, new SoundTransform(.1));
		}
	}
}
