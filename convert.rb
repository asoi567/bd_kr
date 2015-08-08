require 'fileutils'

print 'Enter FIO: '
fio = gets.strip[0, 3].upcase

puts "Starting converting ASB -> #{fio}"
dir = File.join('converted/', fio)
FileUtils.rm_r dir if Dir.exists? dir
Dir.mkdir dir
