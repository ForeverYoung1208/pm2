$.get '/transferts.json?level='+given_level, {dataType: 'json'}, (data)->
	switch true
		when given_level == 1
			t.my_map = new Flows_map( data, {
				# Properties needed by my animation envelope of mapbox

				# 1/(how many steps from origin to destination)
				# kdelta = 0.005  500 steps(frames) from origin to destination
				kdelta: 0.01,
				# 1/(how often points will spawm) ( kspawn = 500  will spawm point every 500 frame for flow value = 1) 
				kspawn: 200,
				# spread of flow values from 0 to normal_spread (20)
				normal_spread: 20,
				areas_path: "/areas.json?level="+given_level,
				level: given_level,
				next_zoom: 7,
			
			},{
				# Properties needed by mapbox 
				containerid: 'map',
				# //Kyiv
				# 50°27′N 	30°31′E
				# center = [30.445, 50.5166]
				center: [30.5, 49.0],

				zoom: 5.5,
				minZoom: 3,
				maxZoom: 7		
			});

		when given_level == 2
			t.my_map =  2

		when given_level == 3
			t.my_map =  3



my_map.map.on('load', ->
	animate();
)

my_map.map.on('change_level', (e) ->
	alert(e.detail.level + ' ' + e.detail.area_id )
)

	



`		
function animate(){
	if ( my_map.do_frame() ) {
		requestAnimationFrame(animate) 
	}
}
`




