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
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済み' do
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

  describe '画面のテスト' do
    context 'マイページの確認' do
      before do
        visit user_path(user)
      end
      it '自分の名前と紹介文が表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content user.user_info
      end
      it '自分のユーザ編集画面へのリンクが存在する' do
        expect(page).to have_link '', href: users_mypage_edit_path
      end
      it '自分のアカウント編集画面へのリンクが存在する' do
        # expect(page).to have_link '', href: edit_user_path
        expect(page).to have_link ''
      end
      it 'いいね一覧ボタンが表示される' do
        expect(page).to have_link '', href: favorites_index_path
      end
    end

    context '投稿画面のテスト' do
      before do
        visit new_bread_path(user)
      end
      it '「投稿フォーム」と表示される' do
        expect(page).to have_content '投稿フォーム'
      end
      it 'bread_nameフォームが表示される' do
        expect(page).to have_field 'bread[bread_name]'
      end
      it 'bread_nameフォームに値が入っていない' do
        expect(find_field('bread[bread_name]').text).to be_blank
      end
      it 'introduceフォームが表示される' do
        expect(page).to have_field 'bread[introduce]'
      end
      it 'introduceフォームに値が入っていない' do
        expect(find_field('bread[introduce]').text).to be_blank
      end
      it '登録するボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end
  #   context '投稿成功のテスト' do
  #     before do
  #       visit breads_path(user)
  #     end
  #     before do
  #       # fill_in 'bread[bread_name]', with: bread.bread_name
  #       # fill_in 'bread[introduce]', with: bread.introduce
  #       # fill_in 'drink[drink_name]', with: bread.drink.drink_name
  #       click_button '登録する'
  #     end

  #     it '自分の新しい投稿が正しく保存される' do
  #       expect { click_button '登録する' }.to change(users.bread, :count).by(1)
  #     end
  #     it 'リダイレクト先が、保存できた投稿の詳細画面になっている' do
  #       expect(current_path).to eq '/breads/' + bread.last.id.to_s
  #     end
  #   end
  end

  describe '自分の投稿詳細画面のテスト' do
    before do
      visit bread_path(bread)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/breads/' + bread.id.to_s
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
      it '投稿の編集リンクが表示される' do
        expect(page).to have_link '編集', href: edit_bread_path(bread)
      end
      it '投稿の削除リンクが表示される' do
        expect(page).to have_link '削除', href: bread_path(bread)
      end
    end
  end

  describe 'ユーザ一覧画面のテスト' do
    before do
      visit users_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users'
      end
      it '自分と他人の画像が表示される: userの画像が3つ存在する' do
        expect(all('img').size).to eq(3)
      end
      it '自分と他人の名前がそれぞれ表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content other_user.name
      end
      it '自分と他人のshowリンクがそれぞれ表示される' do
        expect(page).to have_link '', href: user_path(user)
        expect(page).to have_link '', href: user_path(other_user)
      end
    end
  end
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '自分と他人の投稿画像のリンク先が正しい' do
        expect(page).to have_link '', href: bread_path(bread)
        expect(page).to have_link '', href: bread_path(other_bread)
      end
    end
  end

end