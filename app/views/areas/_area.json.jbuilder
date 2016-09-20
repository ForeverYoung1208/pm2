json.type "FeatureCollection"
json.features do
	json.array! [1] do |i|
		json.type "Feature"
		json.extract! area, :geometry, :properties
	end
end