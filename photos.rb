# frozen_string_literal: true

class Photos 
  def initialize(src, target)
    @src = src
    @target = target
  end

  # TODO: logging errors (if file not exist, for example)

  def sync
    src_files = Dir.glob("#{@src}/*.{jpg,JPG}")
    target_files = Dir.glob("#{@target}/*.{raw,RAW}")

    bases = src_files.map do |file|
      File.basename(file, File.extname(file))
    end

    target_files.each do |file|
      File.delete(file) unless bases.include?(File.basename(file, File.extname(file)))
    end

    puts "Done!"
  end
end
