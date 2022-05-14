#frozen_string_literal: true

require 'rails_helper'

describe "投稿のテスト" do
  let!(:list) { FactoryBot.create(:list) }
  it "be_valid" do
    expect(list).to be_valid
  end
  describe
end