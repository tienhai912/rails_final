require "rails_helper"

RSpec.describe BooksController, type: :controller do
  describe "GET index" do
    before {get :index}
    subject {response}
    it {is_expected.to render_template :index}
  end
end
