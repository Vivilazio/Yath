module Yath
  require 'action_view'
  class Tabs
    attr_reader :tabs, :block, :current_path, :active
    include ActionView::Helpers

    def initialize opts, &block
      @tabs = []
      @current_path = opts[:current_path]
      @active = opts[:active] || "active"
      @class_name = opts[:class_name] || "nav nav-tabs"
      #@block = instance_eval(&block)
      if block.arity == 1               # the arity() check
        @block = block[self]            # argument expected, pass the object
      #else
        #@block = instance_eval(&block)  # no argument, use instance_eval()
      end
    end

    def add_tab title, path, opts={}
      @tabs << Tab.new(title, path, opts)
    end

    def do_tabs
      lista = @tabs.map do |tab|
	if current_path == tab.path && (!tab.opts[:data] || !tab.opts[:data][:method] || tab.opts[:data][:method] == "get")
          %Q(<li class="#{@active}">#{tab.link_to}</li>)
        else
          %Q(<li>#{tab.link_to}</li>)
        end
      end.join(' ')
      %Q(<ul class="#{@class_name}">#{lista}</ul>)
    end
  end
end
