# frozen_string_literal: true

# Sync jpg and raw files between two folders
class Photos 
  def initialize(src, target, options = {})
    @src = File.expand_path(src, Dir.pwd)
    @target = File.expand_path(target, Dir.pwd)
    @options = options
  end

  def sync
    src_files = Dir.glob("#{@src}/*.{jpg,JPG}")
    target_files = Dir.glob("#{@target}/*.{nef,NEF}")

    bases = src_files.map do |file|
      File.basename(file, File.extname(file))
    end

    target_files.each do |file|
      unless bases.include?(File.basename(file, File.extname(file)))
        puts "Deleting file #{file}" if @options[:verbose]
        File.delete(file)
      end
    end

    puts "Done!"
  end
end
