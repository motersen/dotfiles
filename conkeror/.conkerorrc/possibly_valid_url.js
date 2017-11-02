function possibly_valid_url (str) {
	return /^[^!\/\:]+\./.test(str);
}
