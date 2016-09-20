class Transfert
	include Mongoid::Document
	field :code_koatuu, type: String
	field :code, type: String
	field :name, type: String
	field :name_koatuu, type: String
	field :openbudget_id, type: String
	field :coord_x, type: Float
	field :coord_y, type: Float
	field :baz_dot, type: BigDecimal
	field :rev_dot, type: BigDecimal
	field :osv_subv, type: BigDecimal
	field :med_subv, type: BigDecimal
	field :comment, type: String
	has_one :area
#	field :area_id, type: String



	def self.load_linktable_from_csv_file(file_path)
		csv = load_csv(file_path)
		csv.each do |row|
				self.create!(row.to_hash) if row
		end
	end

	def self.attach_transfert_values(file_path)
		csv = load_csv(file_path)
		affected_rows = 0

		csv.each do |row|
			self.where( :code => row["code"]).update_all( row.to_hash )
		end
	end

	def build_link_to_area
		if name_koatuu and !area
			a = Area.where({"properties.title": /#{name_koatuu[0..5]}/i}).first
#			a = Area.where({"properties.title": /#{name_koatuu[0..5]}/i}).where("properties.level": "area").first
			self.area = a
		end
	end


	## Kyiv
	def origin
		[30.445, 50.5166]
	end


	def destination
		if self.coord_x&&self.coord_y 
			result = [self.coord_x, self.coord_y]
		else
			## fake destination to prevent error
			result = [31.445, 51.5166]
		end
	end

	# transfert value sign is relative to type of dotation
	def value
		self.baz_dot = 0 if !self.baz_dot
		self.rev_dot = 0 if !self.rev_dot
		result = self.baz_dot.to_f - self.rev_dot.to_f
	end

private

	def self.load_csv(file_path)
		require 'csv'   		
		csv = CSV.read(file_path, :col_sep => ';', :headers => true, :encoding => 'windows-1251:utf-8')
	end


	
end
