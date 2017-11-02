define_webjump("dictcc", "http://www.dict.cc/?s=%s");

function read_url_subreddit_handler (input) {
	if (/^r\/\w+$/.test(input))
		return "https://reddit.com/"+input;
	return null;
}

function read_url_ddg_bang_handler (input) {
	if (/^!/.test(input))
		return read_url_make_default_webjump_handler("duckduckgo")(input);
	return null;
}

read_url_handler_list.push(read_url_make_blank_url_handler(homepage));
read_url_handler_list.push(read_url_subreddit_handler);
read_url_handler_list.push(read_url_ddg_bang_handler);
