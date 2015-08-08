require 'fileutils'
Encoding.default_external = 'CP866'

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
      content = File.read file_name
      File.write File.join(dir, '/', new_file_name), convert(content)
    end
  end

  private

  def convert(string)
    string
      .gsub(/ASBF_/, "#{fio}F_")
      .gsub(/asbf_/, "#{fio.downcase}f_")
      .gsub(/asb\s/, "#{fio.downcase} ")
      .gsub(/asb_/, "#{fio.downcase}_")
  end
end

print 'Enter FIO: '
converter = Converter.new(gets)
puts "Starting converting ASB -> #{converter.fio}"
converter.perform
puts "Done"
