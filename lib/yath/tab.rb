module Yath
  class Tab
    attr_accessor :title, :path, :opts
    def initialize(title, path, opts={})
      @title = title
      @path = path
      @opts = opts
      @opts.reverse_merge! method: "get"
    end
  end
end