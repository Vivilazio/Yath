$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yath'

require 'minitest/autorun'

class TestYath < Minitest::Test

  def test_create_tabs
    output = ""
    output = Yath::tabs current_path: "/prova" do |t|
      t.add_tab "prova", "/prova"
      t.add_tab "test", "/test"
    end
    expected = %Q(<ul class="nav nav-tabs"><li class="active"><a href="/prova" data-method="get">prova</a></li> <li><a href="/test" data-method="get">test</a></li></ul>)
    assert_equal expected, output
  end

end
