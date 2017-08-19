// Github.com
let (sheet = get_home_directory()) {
    sheet.append(".conkerorrc");
    sheet.append("stylesheets");
    sheet.append("github.css");

    register_user_stylesheet(make_uri(sheet));
}
