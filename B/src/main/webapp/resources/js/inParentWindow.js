function inParentWindow(location=null) {
		  if(location != null) window.parent.location.href = location;
		  else window.parent.location.reload();
}
