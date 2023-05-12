#frozen_string_literal: true
require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
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

  describe 'アバウト画面のテスト' do
    before do
      visit '/homes/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/homes/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'KyotoBreadリンクが表示される: 左上から1番目のリンクが「KyotoBread」である' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link)      end
      it 'ゲストログインリンクが表示される: 左上から2番目のリンクが「Guest Log in」である' do
        expect(page).to have_link 'Guest Log in', href: user_guest_sign_in_path
      end
      it 'Aboutリンクが表示される: 左上から3番目のリンクが「About」である' do
        expect(page).to have_link 'About', href: homes_about_path
      end
      it 'Sign upリンクが表示される: 左上から4番目のリンクが「Sign up」である' do
        expect(page).to have_link 'Sign up', href: new_user_registration_path
      end
      it 'Log inリンクが表示される: 左上から5番目のリンクが「Log in」である' do
        expect(page).to have_link 'Log in', href: new_user_session_path
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'KyotoBreadを押すと、トップ画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.delete(' ')
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        about_link = find_all('a')[2].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/homes/about'
      end
      it 'Sign upを押すと、新規登録画面に遷移する' do
        sign_up_link = find_all('a')[3].native.inner_text
        sign_up_link = sign_up_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link sign_up_link, match: :first
        is_expected.to eq '/user/sign_up'
      end
      it 'Log inを押すと、ログイン画面に遷移する' do
        log_in_link = find_all('a')[4].native.inner_text
        log_in_link = log_in_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link log_in_link, match: :first
        is_expected.to eq '/user/sign_in'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/user/sign_up'
      end
      it '「Sign up」と表示される' do
        expect(page).to have_content 'Sign up'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it 'Sign upボタンが表示される' do
        expect(page).to have_button 'Sign up'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録した状態のトップになっている' do
        click_button 'Sign up'
        # expect(current_path).to eq '/users/' + User.last.id.to_s
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(page).to have_current_path('/user/sign_in')
      end
      it '「Log in」と表示される' do
        expect(page).to have_content 'Log in'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'Log in'
      end
      it 'nameフォームは表示されない' do
        expect(page).not_to have_field 'user[name]'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、ログインした状態のトップになっている' do
        expect(current_path).to eq '/'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/user/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end

    context 'ヘッダーの表示を確認' do
      it 'KyotoBreadリンクが表示される: リンクが「KyotoBread」である' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link)
      end
      it 'GuestまたはMypageリンクが表示される: リンクが「Guest」または「Mypage」である' do

        expect(page).to have_link 'Mypage', href: new_user_registration_path

      end
      it 'New Postリンクが表示される: リンクが「New Post」である' do
        bread_link = find_all('a')[2].native.inner_text
        expect(bread_link).to match(/New Post/)
      end
      it 'Usersリンクが表示される: リンクが「Users」である' do
        user_users_link = find_all('a')[3].native.inner_text
        expect(user_users_link).to match(/Users/)
      end
      it 'Log outリンクが表示される: リンクが「Log out」である' do
        log_out_link = find_all('a')[4].native.inner_text
        expect(log_out_link).to match(/Log out/)
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      # log_out_link = find_all('a')[4].native.inner_text
      # log_out_link = log_out_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link 'Log out'

    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/homes/about'
        # expect(current_path).to eq '/'
        expect(page).to have_link 'Sign up', href: new_user_registration_path

      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
