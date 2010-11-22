package org.assetloader.example.robotlegs.visualloadertest.controller.output
{
	import org.assetloader.example.robotlegs.visualloadertest.model.ConsoleModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class BaseOutputCommand extends Command
	{

		[Inject]
		public var consoleModel : ConsoleModel;

		protected var _color : String = "#FFFFFF";
		protected var _size : String = "+0";

		protected var _text : String = "";

		override public function execute() : void
		{
			consoleModel.append("<font size='" + _size + "' color='" + _color + "'> " + _text + "</font>", true);
		}

		protected function append(text : String, breakLine : Boolean = true) : void
		{
			_text += text + (breakLine ? "\n" : "");
		}

		protected function bigger(text : String, howMuch : Number = 1) : String
		{
			return "<font size='+" + howMuch + "'><b>" + text + "</b></font>";
		}

		protected function addDividerLine() : void
		{
			append("---------------------------------------------------------------------------------------------------------");
		}
	}
}
