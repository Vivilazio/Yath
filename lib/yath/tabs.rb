module Yath
  require 'action_view'
  class Tabs
    attr_reader :tabs, :block, :current_path
    include ActionView::Helpers

    def initialize opts, &block
      @tabs = []
      @current_path = opts[:current_path]
      #@block = instance_eval(&block)
      if block.arity == 1               # the arity() check
        @block = block[self]            # argument expected, pass the object
      else
        @block = instance_eval(&block)  # no argument, use instance_eval()
      end
    end
    
    def add_tab title, path, opts={}
      @tabs << Tab.new(title, path, opts)
    end
    
    def do_tabs
      "<ul>"+@tabs.map do |tab|
        if current_path == tab.path && tab.opts[:method] == "get"
          %Q(<li class="current"><span>#{tab.title}</span></li>)
        else
          %Q(<li>#{link_to tab.title, tab.path, tab.opts}</li>)
        end
      end.join(' ')+"</ul>"
    end

    def do_ajax_tabs
      "<ul>"+@tabs.map do |tab|
        if current_path == tab.path
          "<li>"+link_to(tab.title, "#current-tab", tab.opts)+"</li>"
        else
          "<li>"+link_to(tab.title, tab.path, tab.opts)+"</li>"
        end
      end.join(' ')+"</ul>"
    end
  end
end