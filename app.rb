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
	  @ip_log.each do |value|
	    unless value.empty?
	      found_ips = value.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
	      # Добавляем только если нашли IP
	      ip << found_ips.first unless found_ips.empty?
	    end
	  end
	  ip
	end
end

class HowManyIP
	def how_ip(all_ip)
		all_ip.tally
	end
end


read_log = ReadLog.new('access.log')
search_ip = SearchIP.new(read_log.ip_log)
how_ip = HowManyIP.new

ip = how_ip.how_ip(search_ip.ip_all)

ip.each do |key, value|
	puts "IP: #{key}, количество: #{value}"
end