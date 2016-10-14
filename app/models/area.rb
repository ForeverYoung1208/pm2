class Area
	include Mongoid::Document
	field :geometry, type: Hash
	field :properties, type: Hash
	has_one :transfert
	belongs_to :area

	has_one :parent , class_name: "Area", inverse_of: :children
	has_many :children, class_name: "Area", inverse_of: :parent

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

#Clean up loaded areas from unuseful garbage

	def self.cleanup_from_file
		self.each do |a| 
			a.unset(:'properties.id', :'properties.communities_count', :'properties.bounds')
		end
		self.where(:'properties.level'=> 'area').update_all( :'properties.level'=> 1)

	end

	def self.gather_from_vybory


		# http://info-vybory.in.ua/ivservlets/geometry?level=2&koatuu=1200000000&dtfrom=2016-10-14
	end



end
