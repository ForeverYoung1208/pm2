$.get('/transferts.json?level=area', {dataType: 'json'}, (data)->

	my_map1 = new Flows_map( data, {
		# //Kyiv
		# 50°27′N 	30°31′E
		# center = [30.445, 50.5166]
		center: [30.5, 49.0],
		# 1/(how many steps from origin to destination)
		# kdelta = 0.005  500 steps(frames) from origin to destination
		kdelta: 0.01,
		# 1/(how often points will spawm) ( kspawn = 500  will spawm point every 500 frame for flow value = 1) 
		kspawn: 200,
		# spread of flow values from 0 to normal_spread (20)
		normal_spread: 20,
		areas_path: "/areas.json"
	});

	my_map1.setupmap({
		#// container id
		containerid: 'map',
		center: [30.5, 49.0],
		zoom: 5.5,
		minZoom: 3,
		maxZoom: 5.5
	});

	`		
	function animate(){
		my_map1.counter = my_map1.counter + 1
		my_map1.calc_points_new_position()
		my_map1.check_for_spawn()
		my_map1.flush_points_data()

		if (my_map1.counter < my_map1.end) {
			requestAnimationFrame(animate) 
		}
	}
	`		
	my_map1.map.on('load', ->
		animate();
	)

	my_map1.map.on('click', ->
		alert('click')
	)

);