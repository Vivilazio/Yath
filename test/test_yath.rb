require 'test/unit'
require 'yath'

class TestYath < Test::Unit::TestCase

  def test_create_tabs
    output = ""
    output = Yath::tabs current_path: "/prova" do
      add_tab "prova", "/prova"
      add_tab "test", "/test"
    end
    expected = %Q(<ul><li class="current"><span>prova</span></li> <li><a href="/test" data-method="get">test</a></li></ul>)
    assert_equal expected, output
  end
  def test_create_ajax_tabs
    output = ""
    output = Yath::ajax_tabs current_path: "/prova" do
      add_tab "prova", "/prova"
      add_tab "test", "/test"
    end
    expected = %Q(<ul><li><a href="#current-tab" data-method="get">prova</a></li> <li><a href="/test" data-method="get">test</a></li></ul>)
    assert_equal expected, output
  end
end