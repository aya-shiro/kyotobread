require 'rails_helper'

describe '管理者画面のテスト' do
  let(:admin) { create(:admin) }

  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:bread) { create(:bread, user: user) }
  let!(:other_bread) { create(:bread, user: other_user) }
  let!(:feedback) { create(:feedback, user: user) }
  let!(:feedback) { create(:feedback, user: other_user) }
  
  describe 'アドミンログイン前のテスト' do
    before do
      visit new_admin_session_path
    end
    context '表示内容の確認' do
      it 'ゲストログインリンクが表示される: 表示が「Guest Log in」である' do
        expect(page).to have_link 'Guest Log in', href: user_guest_sign_in_path
      end
      it 'Aboutリンクが表示される: 表示が「About」である' do
        expect(page).to have_link 'About', href: homes_about_path
      end
      it 'Sign upリンクが表示される: 表示が「Sign up」である' do
        expect(page).to have_link 'Sign up', href: new_user_registration_path
      end

      it 'Log inリンクが表示される: 表示が「Log in」である' do
        expect(page).to have_link 'Log in', href: new_user_session_path
      end
    end
  end
  
  describe 'ヘッダーのテスト: ログインしている場合' do
    before do
      visit admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'
    end

    context 'ヘッダーの表示を確認' do
      it 'ログイン後のリダイレクト先が、ログインした状態のトップになっている' do
        expect(current_path).to eq '/admin'
      end
      it 'KyotoBreadリンクが表示される: リンクが「KyotoBread」である' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link)
      end
      it '管理者トップリンクが表示される: リンクが「管理者トップ」である' do
        have_link('管理者トップ', href: admin_root_path)
      end
      it 'ユーザーリンクが表示される: リンクが「ユーザー」である' do
        expect(page).to have_link 'ユーザー', href: admin_users_path
      end
      it 'ショップリンクが表示される: リンクが「ショップ」である' do
        expect(page).to have_link 'ショップ', href: admin_shops_path
      end
      it '特集リンクが表示される: リンクが「特集」である' do
        expect(page).to have_link '特集', href: admin_topics_path
      end
      it 'ドリンクリンクが表示される: リンクが「ドリンク」である' do
        expect(page).to have_link 'ドリンク', href: admin_drinks_path
      end
      it 'Log outリンクが表示される: リンクが「Log out」である' do
        expect(page).to have_link 'Log out', href: destroy_admin_session_path
      end
    end
  end
  
  describe '画面のテスト' do
    before do
      visit admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'
    end
    
    context '管理者トップページの確認' do
      before do
        visit admin_root_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq '/admin'
      end
      it 'ご意見箱の本文と投函ユーザーのリンク先が正しい' do
        expect(page).to have_link '', href: admin_feedback_path(feedback)
        expect(page).to have_link '', href: admin_user_path(other_user)
      end
      it '自分と他人の投稿画像のリンク先が正しい' do
        expect(page).to have_link '', href: admin_bread_path(bread)
        expect(page).to have_link '', href: admin_bread_path(other_bread)
      end
    end
    
    context 'ユーザー投稿内容の確認' do
      let!(:comment) { create(:bread, user: user) }

      before do
        visit admin_bread_path(bread)
      end
      it '投稿のtitleが表示される' do
        expect(page).to have_content bread.bread_name
      end
      it '投稿のintroduceが表示される' do
        expect(page).to have_content bread.introduce
      end
      it '投稿のdrink_nameが表示される' do
        expect(page).to have_content bread.drink.drink_name
      end
      it '投稿の削除リンクが表示される' do
        expect(page).to have_link '削除', href: admin_bread_path(bread)
      end
      it 'コメントの削除リンクが表示される' do
        # expect(page).to have_link '削除', href: admin_bread_comment_path(comment.bread, comment)
        expect(page).to have_link '削除', href: admin_bread_comment_path(comment.bread_id, comment)

      end
    end
  end
  
  
  
  
  
  
  
  
  
  describe '管理者ログアウトのテスト' do
    before do
      visit admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'
      click_link 'Log out'
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/homes/about'
        expect(page).to have_link 'Sign up', href: new_user_registration_path
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end