class Transfert
	include Mongoid::Document
	field :code_koatuu, type: String
	field :code, type: String
	field :name, type: String
	field :coord_x, type: Float
	field :coord_y, type: Float
	field :baz_dot, type: BigDecimal
	field :rev_dot, type: BigDecimal
	
	
	def origin
		[30.445, 50.5166]
	end

	def destination
		if self.coord_x&&self.coord_y 
			result = [self.coord_x, self.coord_y]
		else
			result = [31.445, 51.5166]
		end
	end

	def value
		self.baz_dot = 0 if !self.baz_dot
		self.rev_dot = 0 if !self.rev_dot

		result = self.baz_dot - self.rev_dot
	end
	
end
