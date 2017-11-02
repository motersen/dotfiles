define_webjump("dictcc", "http://www.dict.cc/?s=%s");

function read_url_subreddit_handler (input) {
	return /^r\/\w+$/.test(input)
		? "https://reddit.com/"+input
		: null;
}

function read_url_ddg_bang_handler (input) {
	return /^!/.test(input)
		? read_url_make_default_webjump_handler("duckduckgo")(input)
		: null;
}

read_url_handler_list.push(read_url_make_blank_url_handler(homepage));
read_url_handler_list.push(read_url_subreddit_handler);
read_url_handler_list.push(read_url_ddg_bang_handler);
