require_relative 'test_helper'

class ItsOverAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end

  def test_about
    get '/about'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end

  def test_its_over
    get '/its_over'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end
end
