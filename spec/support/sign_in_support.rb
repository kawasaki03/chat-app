module SignInSupport
  def sign_in(user)
    # ログイン処理の記述
    visit new_user_session_path
    #情報を入力する
    fill_in 'user_email',with: user.email
    fill_in 'Password',with: user.password
    #ボタンを押す
    click_on "Log in"
    #トップページに遷移する
    expect(current_path).to eq root_path
  end
end