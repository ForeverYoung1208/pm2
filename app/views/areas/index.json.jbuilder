# json.array! @areas, partial: 'areas/area', as: :area
json.type "FeatureCollection"
json.features do
	json.array! @areas do |area|
		json.type "Feature"
		json.extract! area, :geometry, :properties
	end
end