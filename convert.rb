require 'fileutils'

class Converter
  attr_accessor :fio, :dir

  def initialize(fio)
    @fio = fio.strip[0, 3].upcase
    @dir = File.join('converted/', @fio)
  end

  def perform
    FileUtils.rm_r dir if Dir.exists? dir
    Dir.mkdir dir

    Dir.glob('ASB/*').each do |file_name|
      new_file_name = convert file_name.gsub(/^ASB\//, '')
    end
  end

  private

  def convert(string)
    string
      .gsub(/ASBF_/, "#{fio}F_")
      .gsub(/asbf_/, "#{fio.downcase}f_")
  end
end

print 'Enter FIO: '
converter = Converter.new(gets)
puts "Starting converting ASB -> #{converter.fio}"
converter.perform
puts "Done"
