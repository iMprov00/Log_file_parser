class ReadLog #класс для чтения лога
	def initialize(path)
		@path = path #присваиваем переменной адрес лога
	end

	def ip_log 
		read #метод просто сохраняет в себе уже прочитанный лог их метода
	end

	def read #метод читает лог по строкам
		File.readlines(@path)
	end
end

class SearchIP #класс для поиска IP адрессов
	def initialize(ip_log)
		@ip_log = ip_log #сохраняем в переменную переданный файл
	end

	def ip_all #метод просто присваивает найденные адреса
		search
	end

	def search
	  ip = Array.new #создаем переменную которыя будет хранить в себе массив найденых адресов
	  @ip_log.each do |value| #проходимся по каждому элементу 
	    unless value.empty? #проверяем чтобы строка содержала в себе адрес
	      found_ips = value.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/) # присваиваем адрес когда находим
	      # Добавляем только если нашли IP
	      ip << found_ips.first unless found_ips.empty?
	    end
	  end
	  ip
	end
end

class HowManyIP #класс для подсчета количества адресов
	def how_ip(all_ip)
		all_ip.tally #возвращает хэш из ключей (адресов) и их количества
	end
end


read_log = ReadLog.new('access.log') #создаем экземпляр класса для чтения
search_ip = SearchIP.new(read_log.ip_log) #создаем экземпляр класса для поиска всех адресов
how_ip = HowManyIP.new #создаем экземпляр класса для определения количества адресов

ip = how_ip.how_ip(search_ip.ip_all) #просто присваиваем переменной хэш из экземпляра класса how_ip 

ip.each do |key, value| #проходимся по каждому элементу хэша
	puts "IP: #{key}, количество: #{value}" #выводим адрес и его количество 
end