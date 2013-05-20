require "yath/version"
require "yath/tabs"
require "yath/tab"
require 'action_view'
#include ActionView::Helpers"
module Yath
  def self.tabs opts, &block
    Tabs.new(opts, &block).do_tabs.html_safe
  end
end
