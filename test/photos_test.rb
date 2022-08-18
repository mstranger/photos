require "minitest/autorun"

require_relative "../photos.rb"

describe Photos do
  Minitest.after_run do
    src = File.expand_path("fixtures/bkp", __dir__)
    target = File.expand_path("fixtures/folders", __dir__)

    # delete folder fixtures/folders
    FileUtils.rm_rf(target)

    # copy folder fixtures/bkp to fixtures/folders
    FileUtils.cp_r("#{src}/.", target)
  end

  before do
    @src = File.expand_path("fixtures/folders/jpg", __dir__)
    @target = File.expand_path("fixtures/folders/raw", __dir__)

    Photos.new(@src, @target).sync
  end

  it "has sync two folders" do
    src = Dir.glob("#{@src}/*.{jpg,JPG}").map { |t| File.basename(t, File.extname(t)) }.sort
    target = Dir.glob("#{@target}/*.{raw,RAW}").map { |t| File.basename(t, File.extname(t)) }.sort
    assert_equal src, target
  end
end

