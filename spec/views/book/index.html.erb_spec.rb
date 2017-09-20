require "rails_helper"

RSpec.describe "books/index", type: :view do
  before :each do
    book1 = FactoryGirl.create :book
    book2 = FactoryGirl.create :book
    @books = [book1, book2]
    @books_support = Supports::BookSupport
      .new books: Book.all, param: params
  end

  context "when renders correctly" do
    it "renders all template" do
      render
      expect(view).to render_template partial: "_index_search", count: 1
      expect(view).to render_template partial: "_index_content", count: 1
      expect(view).to render_template partial: "_book_detail", count: @books.count
    end
  end

  context "when displays all books" do
    it "displays book" do
      render
      @books.each do |book|
        expect(rendered).to include book.title, book.author,
          book.publish_date.strftime(I18n.t("date_format_1")), book.description
      end
    end
  end
end
