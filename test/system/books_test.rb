require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Accepted date", with: @book.accepted_date
    fill_in "Authors", with: @book.authors
    fill_in "Book type", with: @book.book_type
    fill_in "Country", with: @book.country_id
    check "Is refereed" if @book.is_refereed
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Published date", with: @book.published_date
    fill_in "Publisher", with: @book.publisher
    fill_in "Sent date", with: @book.sent_date
    fill_in "Status", with: @book.status
    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Accepted date", with: @book.accepted_date
    fill_in "Authors", with: @book.authors
    fill_in "Book type", with: @book.book_type
    fill_in "Country", with: @book.country_id
    check "Is refereed" if @book.is_refereed
    fill_in "Isbn", with: @book.isbn
    fill_in "Pages", with: @book.pages
    fill_in "Published date", with: @book.published_date
    fill_in "Publisher", with: @book.publisher
    fill_in "Sent date", with: @book.sent_date
    fill_in "Status", with: @book.status
    fill_in "Title", with: @book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
