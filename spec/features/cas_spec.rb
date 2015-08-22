feature "Browsing the CAS server" do
  it 'should display the login page' do
    visit('/cas/login')
    expect(page).to have_css('form#fm1 input#username')
    expect(page).to have_css('form#fm1 input#password')
  end
end


