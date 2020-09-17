require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user =FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージが全て削除される' do
  #サインインする
    sign_in(@room_user.user)
  #トップページに遷移する
    expect(current_path).to eq root_path
  #チャットルームに遷移する
    click_on(@room_user.room.name)
  #メッセージを５つ追加する
    @message=FactoryBot.create_list(:message,5,room_id: @room_user.room.id)
  #チャットを終了するボタンを押すとデータが削除され、レコードが1つ減る
    expect{
      find_link("チャットを終了する",  href: room_path(@room_user.room)).click
    }.to change { @room_user.room.messages.count }.by(-5)
  #トップページに遷移する
  expect(current_path).to eq root_path
  #

  end

end
