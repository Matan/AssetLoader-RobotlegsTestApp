package org.assetloader.example.robotlegs.visualloadertest.view
{
	import fl.controls.TextArea;

	import flash.display.Sprite;
	import flash.text.TextFormat;

	/**
	 * @author Matan Uberstein
	 */
	public class Console extends Sprite
	{
		protected var _area : TextArea;

		public function Console()
		{
			_area = new TextArea();
			_area.setStyle("textFormat", new TextFormat("courier new", 11, 0xFFFFFF));
			_area.wordWrap = false;

			_area.textField.background = true;;			_area.textField.backgroundColor = 0x0;

			addChild(_area);
		}

		public function setSize(width : Number, height : Number) : void
		{
			_area.setSize(width, height);
		}

		public function set text(value : String) : void
		{
			_area.htmlText = value;
		}

		public function append(text : String) : void
		{
			_area.htmlText += text;
			_area.verticalScrollPosition = 100;
		}
	}
}
