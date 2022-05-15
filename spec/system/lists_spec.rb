#frozen_string_literal: true

require 'rails_helper'

describe "投稿のテスト" do
  let!(:list) { FactoryBot.create(:list) }
  it "be_valid" do
    expect(list).to be_valid
  end
  describe "トップ画面のテスト" do
    before "トップ画面への遷移" do
      visit root_path
    end
    context "表示の確認" do
      it "トップ画面(top_path)に「ここはTopページです」が表示されているか" do
        expect(page).to have_content "ここはTopページです"
      end
      it "top_pathが\"/top\"であるか" do
        expect(page).to have_link "Top" ,href: "/top"
      end
    end
  end

  describe "投稿画面のテスト" do
    before "投稿画面への遷移" do
      visit new_list_path
    end
    context "表示の確認 " do
      it "new_list_pathが\"/lists/new\"であるか" do
        expect(page).to have_current_path new_list_path
      end
      it "投稿ボタンが表示されているか" do
        expect(page).to have_button "New list"
      end
    end
    context "投稿処理のテスト" do
      it "投稿後のリダイレクト先は正しいか" do
        fill_in "book[title]", with: Faker::Lorem.characters(number:5)
        fill_in "book[body]" , with: Faker::Lorme.characters(number:20)
        click_buttun "投稿"
        expect(page).to have_current_path list_path(List.last)
      end
    end
  end

  describe "一覧画面のテスト" do
    before "一覧画面への遷移" do
      visit lists_path
    end
    context "一覧の表示とリンクの確認" do
      it "一覧表示画面に投稿されたもの表示されているか" do
        expext(page).to have_content list.title
        expext(page).to have_content list.body
      end
    end
  end

  describe "詳細画面のテスト" do
    before "詳細画面への遷移" do
      visit list_path(list)
    end
    context "表示のテスト" do
      it "削除リンクが存在しているか" do
        expect(page).to have_link "削除"
      end
      it "編集リンクが存在しているか" do
        expect(page).to have_link "編集"
      end
    end
    context "リンクの遷移先の確認" do
      it "編集の遷移先は編集画面か" do
        click_buttun "編集"
        expect(page).to have_current_path
      end
    end
    context "list削除のテスト" do
      it "listの削除" do
        edit_link = find_all("a")[3]
        edit_link.click
        expect(current_path).to eq('/list/'+list.id.to_s+'/edit')
      end
    end
  end


end