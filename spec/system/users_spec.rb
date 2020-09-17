require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  it "ログインしていない状態でトップページにアクセスすると、サインインページへ遷移する" do
    #トップページにアクセスする
    visit root_path
    #サインインページへ遷移する
    expect(current_path).to eq (new_user_session_path)
    # expect(page).to have_content("Log in")
  end
  
  it "ログインに成功するとトップページに遷移する" do
    #あらかじめユーザーをDBに保存する
    user=FactoryBot.create(:user)
    #サインインページへアクセスする
    visit new_user_session_path
    #ログインしていない場合、サインインページへ遷移していることを確認する
    expect(current_path).to eq (new_user_session_path)
    #情報を入力する
    fill_in 'user_email',with: user.email
    fill_in 'Password',with: user.password
    #ボタンを押す
    click_on "Log in"
    #トップページに遷移する
    expect(current_path).to eq root_path
    
  end
  
  it "ログインに失敗すると、再びサインインページに戻ってくる" do
    #あらかじめユーザーをDBに保存する
    user=FactoryBot.create(:user)
    #サインインページへアクセスする
    visit new_user_session_path
    #ログインしていない場合、サインインページへ遷移していることを確認する
    expect(current_path).to eq (new_user_session_path)
    #情報を入力する
    fill_in 'user_email',with:"a"
    fill_in 'Password',with: "test"
    #ボタンを押す
    click_on "Log in"
    #サインインページに戻ってきていることを確認する
    expect(current_path).to eq (new_user_session_path)
  end
end