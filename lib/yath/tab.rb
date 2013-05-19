module Yath
  class Tab
    attr_accessor :title, :path, :opts
    def initialize(title, path, opts={})
      @title = title
      @path = path
      @opts = opts
      @opts.reverse_merge! method: "get"
    end
    
    def link_to
      link_to(@title,@path,@opts)
    end
  end
end