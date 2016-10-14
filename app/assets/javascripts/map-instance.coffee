
run = (params) ->
	switch true
		when params.given_level == 1
			_zoom = 5.5
			_minZoom = 3
			_maxZoom = 7		
			_next_zoom = 7
			_next_level = 2

		when params.given_level == 2
			_zoom = 7
			_minZoom = 5
			_maxZoom = 8		
			_next_zoom = 9
			_next_level = 3

		when params.given_level == 3
			_zoom = 9
			_minZoom = 8
			_maxZoom = 10		
			_next_zoom = 9
			_next_level = 3			


	$.get '/transferts.json?level='+params.given_level, {dataType: 'json'}, (data)->
		my_map = new Flows_map( data, {
			# Properties needed by my animation envelope of mapbox

			# 1/(how many steps from origin to destination)
			# kdelta = 0.005  500 steps(frames) from origin to destination
			kdelta: 0.01,
			# 1/(how often points will spawm) ( kspawn = 500  will spawm point every 500 frame for flow value = 1) 
			kspawn: 200,
			# spread of flow values from 0 to normal_spread (20)
			normal_spread: 20,
			areas_path: "/areas.json?level="+params.given_level,
			level: params.given_level,
			next_level: _next_level
			next_zoom: _next_zoom,

		},{
			# Properties needed by mapbox 
			containerid: 'map',
			# //Kyiv
			# 50°27′N 	30°31′E
			# center = [30.445, 50.5166]
			center: params.center,

			zoom: _zoom,
			minZoom: _minZoom,
			maxZoom: _maxZoom		
		});

		my_map.map.on('load', ->
			animate();
		)

		my_map.map.on('change_level', (e) ->
			alert(e.detail.level + ' ' + e.detail.area_id + ' ' + e.detail.new_center)
			run( {
				given_level: my_map.next_level,
				center: e.detail.new_center
			})
		)


		`		
		function animate(){
			if ( my_map.do_frame() ) {
				requestAnimationFrame(animate) 
			}
		}
		`
run({
	given_level: 1,
	center: [30.5, 49.0]
})




