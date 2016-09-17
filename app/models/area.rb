class Area
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

#  field :feature_collection, type: Hash

	def self.load_areas_from_json_file(file_path)
		file = File.read( file_path )
		self.create!( feature_collection = JSON.parse(file) )
	end

end
