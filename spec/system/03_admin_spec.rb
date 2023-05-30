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

    context 'ログイン成功のテスト' do
      before do
        fill_in 'admin[email]', with: 'fromkyoto@admin.com'
        fill_in 'admin[password]', with: 'fromkyoto'
        click_button 'Log in'
      end
      it 'ログイン後のリダイレクト先が、ログインした状態のトップになっている' do
        expect(current_path).to eq '/admin'
      end
    end
  end


end