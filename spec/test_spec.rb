# describe '四則演算' do
#   context '足し算' do
#     it '1 + 1 は 2 になる' do
#       expect(1 + 1).to eq 2
#     end
#   end
#   context '足し算' do
#     it '1 + 1 は 2 になる' do
#       expect(1 + 1).to eq 3
#     end
#   end
# end

  # frozen_string_literal: true

  require 'rails_helper'
  # require 'factory_bot'


  describe '投稿のテスト' do
  	let!(:bread) { create(:bread,bread_name:'hoge',introduce:'introduce') }

	  describe 'トップ画面(root_path)のテスト' do
	    before do
	      visit root_path
	    end
	    context '表示の確認' do
	      it 'トップ画面(root_path)にドリンク別パン一覧ページへのリンクが表示されているか' do
	        expect(page).to have_link "", href: breads_path
	      end
	      it 'root_pathが"/"であるか' do
	        expect(current_path).to eq('/')
	      end
	    end
	  end
	  describe "一覧画面のテスト" do
	   # before do
	   #   visit breads_path
	   # end
	   # context '一覧の表示とリンクの確認' do
	   #   it "bookの一覧表示(divタグ)と投稿フォームが同一画面に表示されているか" do
	   #     expect(page).to have_selector 'div'
	   #   end
	   #   it "breadのタイトルと感想を表示し、詳細・編集・削除のリンクが表示されているか" do
    #       (1..5).each do |i|
    #         Bread.create(bread_name:'hoge'+i.to_s,introduce:'body'+i.to_s)
    #       end
    #       visit breads_path
    #       Bread.all.each_with_index do |bread,i|
    #         j = i * 3
    #         expect(page).to have_content bread.bread_name
    #         expect(page).to have_content bread.introduce
    #         # Showリンク
    #         show_link = find_all('a')[j]
    #         expect(show_link.native.inner_text).to match(/show/i)
    #         expect(show_link[:href]).to eq bread_path(bread)
    #         # Editリンク
    #         show_link = find_all('a')[j+1]
    #         expect(show_link.native.inner_text).to match(/edit/i)
    #         expect(show_link[:href]).to eq edit_bread_path(bread)
    #         # Destroyリンク
    #         show_link = find_all('a')[j+2]
    #         expect(show_link.native.inner_text).to match(/destroy/i)
    #         expect(show_link[:href]).to eq bread_path(bread)
    #       end
	   #   end
	   # end
	   # context '投稿処理に関するテスト' do
	   #   it '投稿に成功しサクセスメッセージが表示されるか' do
	   #     fill_in 'bread[bread_name]', with: Faker::Lorem.characters(number:5)
	   #     fill_in 'bread[introduce]', with: Faker::Lorem.characters(number:20)
	   #     click_button '登録する'
	   #     expect(page).to have_content '登録する'
	   #   end
	   #   it '投稿に失敗する' do
	   #     click_button '登録する'
	   #     expect(page).to have_content 'error'
	   #     expect(current_path).to eq('/breads')
	   #   end
	   #   it '投稿後のリダイレクト先は正しいか' do
	   #     fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
	   #     fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
	   #     click_button 'Create Book'
	   #     expect(page).to have_current_path book_path(Book.last)
	   #   end
	   # end
	   # context 'book削除のテスト' do
	   #   it 'bookの削除' do
	   #     expect{ book.destroy }.to change{ Book.count }.by(-1)
	   #     # ※本来はダイアログのテストまで行うがココではデータが削除されることだけをテスト
	   #   end
	   # end
	  end
	  describe '詳細画面のテスト' do
	   # before do
	   #   visit book_path(book)
	   # end
	   # context '表示の確認' do
	   #   it '本のタイトルと感想が画面に表示されていること' do
	   #     expect(page).to have_content book.title
	   #     expect(page).to have_content book.body
	   #   end
	   #   it 'Editリンクが表示される' do
	   #     edit_link = find_all('a')[0]
	   #     expect(edit_link.native.inner_text).to match(/edit/i)
				# end
	   #   it 'Backリンクが表示される' do
	   #     back_link = find_all('a')[1]
	   #     expect(back_link.native.inner_text).to match(/back/i)
				# end
	   # end
	   # context 'リンクの遷移先の確認' do
	   #   it 'Editの遷移先は編集画面か' do
	   #     edit_link = find_all('a')[0]
	   #     edit_link.click
	   #     expect(current_path).to eq('/books/' + book.id.to_s + '/edit')
	   #   end
	   #   it 'Backの遷移先は一覧画面か' do
	   #     back_link = find_all('a')[1]
	   #     back_link.click
	   #     expect(page).to have_current_path books_path
	   #   end
	   # end
	  end
	  describe '編集画面のテスト' do
	   # before do
	   #   visit edit_book_path(book)
	   # end
	    context '表示の確認' do
	     # it '編集前のタイトルと感想がフォームに表示(セット)されている' do
	     #   expect(page).to have_field 'book[title]', with: book.title
	     #   expect(page).to have_field 'book[body]', with: book.body
	     # end
	   #   it 'Update Bookボタンが表示される' do
	   #     expect(page).to have_button 'Update Book'
	   #   end
	   #   it 'Showリンクが表示される' do
	   #     show_link = find_all('a')[0]
	   #     expect(show_link.native.inner_text).to match(/show/i)
				# end
	   #   it 'Backリンクが表示される' do
	   #     back_link = find_all('a')[1]
	   #     expect(back_link.native.inner_text).to match(/back/i)
				# end
	    end
	    context 'リンクの遷移先の確認' do
	     # it 'Showの遷移先は詳細画面か' do
	     #   show_link = find_all('a')[0]
	     #   show_link.click
	     #   expect(current_path).to eq('/books/' + book.id.to_s)
	     # end
	     # it 'Backの遷移先は一覧画面か' do
	     #   back_link = find_all('a')[1]
	     #   back_link.click
	     #   expect(page).to have_current_path books_path
	     # end
	    end
	    context '更新処理に関するテスト' do
	     # it '更新に成功しサクセスメッセージが表示されるか' do
	     #   fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
	     #   fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
	     #   click_button 'Update Book'
	     #   expect(page).to have_content 'successfully'
	     # end
	     # it '更新に失敗しエラーメッセージが表示されるか' do
	     #   fill_in 'book[title]', with: ""
	     #   fill_in 'book[body]', with: ""
	     #   click_button 'Update Book'
	     #   expect(page).to have_content 'error'
	     # end
	     # it '更新後のリダイレクト先は正しいか' do
	     #   fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
	     #   fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
	     #   click_button 'Update Book'
	     #   expect(page).to have_current_path book_path(book)
	     # end
	    end
	  end

	end