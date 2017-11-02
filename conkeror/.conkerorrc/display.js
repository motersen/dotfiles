interactive("display",
			"Evaluate javascript in minibuffer",
			function(I) {
				var s = yield I.minibuffer.read(
					$prompt = "Eval:",
					$completer = new javascript_completer(conkeror));
				var result = eval(s);
				I.window.minibuffer.message(String(result));
			});
