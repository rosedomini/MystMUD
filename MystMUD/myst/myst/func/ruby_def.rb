
class Array
	def delete_one value
		if i = index(value) then delete_at i end
	end
	
	def echo *args
		s = String.echo *args
		each{|x| x.instance_variable_get(:@msg) << s if x.heroe?}
	end
	
	def no value
		x = clone
		if i = index(value) then x.delete_at i end
		x
	end
	
	def seek needle, count = nil, method = :name
		count = count ? count.to_i : 1
		needle = needle.downcase
		find{|x| x.send(method).downcase.index needle and (count -= 1).zero? }
	end
	
	def named needle, count = 1
		count = count ? count.to_i : 1
		needle = needle.downcase.strip
		find{|x| x.name.downcase.index needle and (count-=1).zero?}
	end
	
	def to_h
		a = {}
		each_with_index{|e, i| a[i] = e}
		a
	end
	
	def wiz sth, color=nil; each{|x| x.wiz sth, color} end
end

unless defined? UTF8
	UTF8 = Encoding.find('UTF-8') end

class << File
	def read_utf8 name, *args
		file = File.open name, *args
		file.set_encoding UTF8
		utf8_content = file.read
		file.close
		utf8_content
	end
end

class Hash	
	def << value
		self[(max or [0])[0]+1] = value
	end
	
	def | h
		r = clone
		h.each do |key, value|
			if r[key] then r[key] += value else r[key] = value
		end end
		r
	end
	
	def echo *args
		s = String.echo *args
		each_value{|x| x.instance_variable_get(:@msg) << s if x.heroe?}
	end
	
	def new_id; (max or [0])[0]+1 end
	
	def no value
		x = clone
		if k = key(value) then x.delete k end
		x
	end
	
	def seek_key needle, count = nil, method = :name
		count = count ? count.to_i : 1
		needle = needle.downcase.strip
		each_key{|x| return x if x.send(method).downcase.index needle and (count -= 1).zero? }
		nil
	end
	
	def seek_value needle, count = nil, method = :name
		count = count ? count.to_i : 1
		needle = needle.downcase.strip
		each_value{|x| return x if x.send(method).downcase.index needle and (count -= 1).zero? }
		nil
	end
	
	def named needle
		needle = needle.downcase.strip
		select{|id, x| x.name.downcase.index needle}
	end
	
	def value_named needle, count = nil
		count = count ? count.to_i : 1
		needle = needle.downcase.strip
		each_value{|x| return x if x.name.downcase.index needle and (count-=1).zero?}
		nil
	end
	
	def key_named needle, count = nil
		count = count ? count.to_i : 1
		needle = needle.downcase.strip
		each_key do |x|
			if x.name.downcase.index needle and (count-=1).zero?
				$value = self[x]
				return x
		end end
		nil
	end
	
	def wiz sth, color=nil
		sth = "<font color=\"#{color}\">#{sth}</font>"
		each_value{|x| x.wiz sth}
	end
end

class Integer
	def resize size
		s = to_s
		return "#{'0'*(size-s.size) if size > s.size}#{s}"
	end
end

class NilClass
	def [] x; end
	def destroyed?; true end
end

class Object
	def destroyed?; @destroyed end
	def destroy; @destroyed = true end
end

class String	
	def link cmd; "<a href=\"javascript:p('#{cmd}')\">#{self}</a>" end
	
	def apos letter = 'e'
		if self =~ /^[aeiouy]/i
			'\'' << self
		else
			letter << ' ' << self
		end
	end
	
	def contains s; downcase.index s.downcase end
	
	def to_class
		Kernel.const_get(self[0].capitalize << self[1..-1])
	end
	
	def self.echo name, *args
		s = ''
		if args.empty?
			s << "\0\0" << ExtCmd[name]
		else
			params = ''
			args.each do |arg|
				params << [arg.bytesize].pack('n').force_encoding(UTF8) << arg.dup.force_encoding(UTF8)
			end
			s << [params.bytesize].pack('n').force_encoding(UTF8) << ExtCmd[name] << params
		end
	end
	
	def escape; CGI.escapeHTML self end
	def starts_with? s; s == self[0, s.length] end
	def same b; downcase == b.downcase end
	def to_b; self == '1' end
end

class Symbol
	def starts_with? s; s == to_s[0, s.length] end
end
