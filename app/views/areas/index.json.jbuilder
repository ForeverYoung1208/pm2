# json.array! @areas, partial: 'areas/area', as: :area
json.type "FeatureCollection"
json.features do
	json.array! @areas do |area|
		json.type "Feature"
		json.extract! area, :geometry
		json.properties do
			json.center area.properties['center']
			json.level area.properties['level']
			json.title area.properties['title']
			json.id area._id.to_s			
		end
	end
end