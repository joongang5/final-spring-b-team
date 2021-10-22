function noSession(url=null) {
		  if(url != null) window.parent.location.href = url;
		  else window.parent.location.reload();
}

function saveLocation(location) {
    	sessionStorage.setItem("currentLocation", location);
}
    