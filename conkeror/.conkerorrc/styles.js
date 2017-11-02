// Github.com

var sheets = get_home_directory();

sheets.append(".conkerorrc");
sheets.append("stylesheets");

var gh = Cc["@mozilla.org/file/local;1"].createInstance(Ci.nsILocalFile);
gh.initWithFile(sheets);
gh.append("github.css");
register_user_stylesheet(make_uri(gh));
