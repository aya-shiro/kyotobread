require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:bread) { create(:bread, user: user) }
  let!(:other_bread) { create(:bread, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it 'New Postを押すと、投稿画面に遷移する' do
        new_link = find_all('a')[2].native.inner_text
        new_link = new_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link new_link
        is_expected.to eq '/breads/new'
      end
      it 'Usersを押すと、ユーザ一覧画面に遷移する' do
        users_link = find_all('a')[3].native.inner_text
        users_link = users_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link users_link
        is_expected.to eq '/users'
      end
    end
  end

end