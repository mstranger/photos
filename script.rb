# TODO: log if no files 
# TODO: tests

src = "folders/jpg"
target = "folders/raw"

src = File.expand_path(src, __dir__)
target = File.expand_path(target, __dir__)

src_files = Dir.glob("#{src}/*.{jpg,JPG}")

bases = src_files.map do |file|
  File.basename(file, File.extname(file))
end

target_files = Dir.glob("#{target}/*.{raw,RAW}")

target_files.each do |file|
  File.delete(file) unless bases.include?(File.basename(file, File.extname(file)))
end

puts "DONE!"

