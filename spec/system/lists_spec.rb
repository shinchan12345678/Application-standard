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
        
      end
    end
  end
end