class Area
  include Mongoid::Document
  field :geometry, type: Hash
  field :properties, type: Hash
  # field :title, type: Sring
  # field :level, type: Sring
  # field :bounds, type: Sring
  # field :level, type: Array
  # field :center, type: Array



#  include Mongoid::Attributes::Dynamic

  field :feature_collection, type: Hash

	def self.load_areas_from_json_file(file_path)
		file = File.read( file_path, :encoding => 'windows-1251' )
		pf = JSON.parse(file)
		pf['features'].each do |a|
			self.create!(
				geometry: a['geometry'],
				properties: a['properties']
			)

		end
	end

end
