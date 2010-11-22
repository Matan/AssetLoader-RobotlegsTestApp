package org.assetloader.example.robotlegs.visualloadertest.model
{
	import org.assetloader.example.robotlegs.visualloadertest.events.ConsoleEvent;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Matan Uberstein
	 */
	public class ConsoleModel extends Actor
	{
		protected var _text : String;

		public function ConsoleModel()
		{
		}

		public function append(text : String, breakLine : Boolean = true) : void
		{
			_text += text + (breakLine) ? "\n" : "";
			dispatch(new ConsoleEvent(ConsoleEvent.APPEND_TEXT, text));
		}

		public function get text() : String
		{
			return _text;
		}
	}
}
