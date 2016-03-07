require 'active_support/core_ext/hash'
module Yath
  class Tab
    attr_accessor :title, :path, :opts
    def initialize(title, path, opts={})
      @title = title
      @path = path
      @opts = opts
      @opts.reverse_merge! data: {}
      @opts[:data].reverse_merge! method: "get"
    end

    def link_to
      %Q(<a href="#{@path}" #{get_attr_from_opts}>#{@title}</a>)
    end

    def get_attr_from_opts
      @opts.map do |k,v|
        if k.to_s == "data"
          v.map do |attr,value|
            %Q(data-#{attr}="#{value}")
          end.join(' ')
        else
          %Q(#{k}="#{v}")
        end
      end.join(' ')
    end
  end
end
