var pastHour_quakes_endpoint =
  "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson";
var tab=[]
$.ajax({
  method: "GET",
  url: pastHour_quakes_endpoint,

  success: function(json) {
    displayQuakes(json);
  },
  error: function() {
    alert("There was an error getting earthquake data.");
  },
  beforeSend: function() {
    $("#page").append("Loading");
  },
  complete: function() {
    $("#loading").remove();
  }
});

let displayQuakes = function(json) {
tab=json.features
  json.features.forEach(function(quake, i) {


      var quakeInstance = `
          <p class="badge">${i}</p>
          <p class="title">${quake.properties.place}</p>
          <button onclick='save(${i})'></button>

         `;

    $("#info").append(quakeInstance);
  });

}; //end displayQuakes

events_list = [];
function save(index){
  console.log(events_list);
  events_list.push(tab[index]);


  $.ajax({
    url: '/events/1',
    method:'POST',
    data: {
      name:this.name,
      descript:this.descriptions
    }
  });

};
