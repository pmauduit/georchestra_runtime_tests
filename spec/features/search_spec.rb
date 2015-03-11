feature "The CAS server" do

  it 'should display the login page' do
    visit('/cas/login')
    page.should have_css('form#fm1 input#username')
    page.should have_css('form#fm1 input#password')

  end

end
