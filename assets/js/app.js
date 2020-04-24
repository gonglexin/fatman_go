// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket"

let channel = socket.channel("places:lobby", {})
channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp); initMap(); })
    .receive("error", resp => { console.log("Unable to join", resp) })


var poly;
var map;
var paths;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: {lat: 29.3483287977, lng: 110.5488580513 }
  });

  paths = []
  poly = new google.maps.Polyline({
    path: paths,
    geodesic: true,
    strokeColor: '#0074D9',
    strokeOpacity: 0.7,
    strokeWeight: 5
  });

  poly.setMap(map);
}

var locationSymbol = {
  path: google.maps.SymbolPath.CIRCLE,
  scale: 5,
  strokeColor: '#393'
};

function updatePlace(place) {
  poly.setMap(null);
  console.log(place);
  paths.push({lat: place.lat, lng: place.lon});
  if(paths.length > 5) {
    paths = paths.slice(Math.max(paths.length - 5, 1))
  }

  poly = new google.maps.Polyline({
    path: paths,
    geodesic: true,
    strokeColor: '#0074D9',
    strokeOpacity: 0.7,
    strokeWeight: 5,
    icons: [{icon: locationSymbol}]
  });

  poly.setMap(map);
}

channel.on("update_place", place => updatePlace(place))
