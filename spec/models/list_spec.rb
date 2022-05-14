#frozen_string_literal: true

require 'rails_helper'

describe "listモデルのテスト" do
  it "有効な投稿の場合、listが保存されるか" do
    expect(FactoryBot.build(:list)).to be_valid
  end
end