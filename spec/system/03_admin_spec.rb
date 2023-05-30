require 'rails_helper'

describe '[STEP1] アドミンログイン前のテスト' do
  describe '管理者ログイン画面のテスト' do
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
      visit new_user_session_path
      fill_in 'admin[email]', with: 'fromkyoto@admin.com'
      fill_in 'admin[password]', with: 'fromkyoto'
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
      # it 'New Postリンクが表示される: リンクが「New Post」である' do
      #   bread_link = find_all('a')[2].native.inner_text
      #   expect(bread_link).to match(/New Post/)
      # end
      # it 'Usersリンクが表示される: リンクが「Users」である' do
      #   user_users_link = find_all('a')[3].native.inner_text
      #   expect(user_users_link).to match(/Users/)
      # end
      # it 'Log outリンクが表示される: リンクが「Log out」である' do
      #   log_out_link = find_all('a')[4].native.inner_text
      #   expect(log_out_link).to match(/Log out/)
      # end
    end
  end


end