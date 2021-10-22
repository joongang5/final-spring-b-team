function noSession() {
	window.parent.location.reload();
}

function anotherLocation(url) {
	window.parent.location.href = url;
}

function saveLocation(location) {
    sessionStorage.setItem("currentLocation", location);
}
    