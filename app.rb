
ip = Array.new

class ReadLog
	def initialize(path)
		@path = path
	end

	def log
		read
	end

	def read
		File.readlines(@path)
	end
end

# lines.each do |line|
# 	ip << i.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
# end
