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
      %Q(<a href="#{@path}" #{get_attr_from_opts}>#{@title}</a>)
    end
    
    def get_attr_from_opts
      @opts.map do |k,v|
        %Q(#{k}="#{v}")
      end.join(' ')
    end
  end
end