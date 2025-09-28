
ip = Array.new

class ReadLog
	def initialize(path)
		@path = path
	end

	def ip_log
		read
	end

	def read
		File.readlines(@path)
	end
end

class SearchIP
	def initialize(ip_log)
		@ip_log = ip_log
	end

	def ip_all
		search
	end

	def search
		ip = Array.new
		@ip_log.each{|value| ip << value.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)}
		ip
	end
end
