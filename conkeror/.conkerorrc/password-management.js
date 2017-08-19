function manage_do_get(window, elem, str) {
    var out = "";
    var result = yield shell_command("pass " + str,
                                     $fds=[{output: async_binary_string_writer("")},
                                           {input: async_binary_reader(function (s) out += s || "") }]);
    window.minibuffer.message(out);
    elem.value = out;
}

interactive("manage-get", "Get a password from the password manager",
            function (I) {
                var n = I.buffer.focused_element;
                yield manage_do_get(I.window, n, (yield I.minibuffer.read($prompt = "password: ")));
                browser_element_focus(I.buffer, n);
            });

define_key(content_buffer_normal_keymap, "C-x p", "manage-get");
