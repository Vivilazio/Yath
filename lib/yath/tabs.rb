module Yath
  require 'action_view'
  class Tabs
    attr_reader :tabs, :block, :current_path
    include ActionView::Helpers

    def initialize opts, &block
      @tabs = []
      @block = instance_eval(&block)
      @current_path = opts[:current_path]
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
      end.join(' ')+"</ul>".html_safe
    end

    def do_ajax_tabs
      a = ''
      "<ul>"+@tabs.map do |tab|
        if current_path == tab.path
          "<li>"+link_to(tab.title, "#current-tab", tab.opts)+"</li>"
        else
          "<li>"+link_to(tab.title, tab.path, tab.opts)+"</li>"
        end
      end.join(' ')+"</ul>".html_safe
    end
  end
end