class Sprite3D

	getter x
	getter y
	getter z
	getter ox
	getter oy
	getter angle : Float64
	getter view_angle

	def initialize
		@model = {} of Int32 => Sprite
		@x = 0
		@y = 0
		@z = 0
		@ox = 0
		@oy = 0
		@angle = 0.0
		@view_angle = 1
	end
	
	def model=(path)
		sheet = Bitmap.new(path)
		@ox = sheet.height/2
		@oy = sheet.height/2
		(sheet.width / sheet.height).times do |i|
			@model[i] = Sprite.new
			@model[i].bitmap = sheet
			@model[i].src_rect = CRGSS::Rect.new(i*sheet.height,0,sheet.height,sheet.height)
			@model[i].position = SF.vector2(@x,@y-i*@view_angle)
			@model[i].z = z+i
  			@model[i].origin = SF.vector2(@ox,@oy)
		end
	end
		
	def x=(x)
		return if x==@x
		@x = x
		@model.size.times do |i|
			@model[i].position = SF.vector2(@x,@y-i*@view_angle)
		end
	end		
	
	def y=(y)
		return if y==@y
		@y = y
		@model.size.times do |i|
			@model[i].position = SF.vector2(@x,@y-i*@view_angle)
		end
	end
	
	def angle=(angle)
		return if angle==@angle
		@angle=angle.to_f
		@model.size.times do |i|
			@model[i].angle = angle
		end
	end

	def view_angle=(view_angle)
		@view_angle = view_angle
		@model.size.times do |i|
			@model[i].position = SF.vector2(@x,@y-i*@view_angle)
		end
	end

	def dispose
		@model.size.times { |i| @model[i].dispose }
	end
end
