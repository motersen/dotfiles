define_webjump("dictcc", "http://www.dict.cc/?s=%s");

function read_url_subreddit_handler (input) {
	if (/^r\/\w+$/.test(input))
		return "https://reddit.com/"+input;
	return null;
}

read_url_handler_list.push(read_url_subreddit_handler);
