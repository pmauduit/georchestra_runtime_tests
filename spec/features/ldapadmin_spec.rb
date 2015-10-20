feature "Browsing the ldapadmin webapp" do
  # Scenario #1: not connected
  # Checks that the SP redirects us onto CAS
  it 'should redirect onto CAS if we are not connected' do
    # ensures we are not connected
    visit('/cas/logout')
    visit('/ldapadmin/')
    expect(page).to have_title 'CAS - geOrchestra'
  end
  # Scenario #2: attempts to connect as testadmin/testadmin
  it 'should let the testadmin/testadmin user authenticate'  do
    visit '/ldapadmin'
    expect(page).to have_title 'CAS - geOrchestra'
    fill_in "username", :with => "testadmin"
    fill_in "password", :with => "testadmin"
    page.find('input[type="submit"]').click
    sleep 1
    expect(current_path).to eq('/ldapadmin/account/userdetails')
  end
  # Scenario #3: Attemps to visit the ldapadmin interface
  it 'should let the testadmin/testadmin user have access to the main ui' do
    visit '/ldapadmin/privateui/'
    expect(current_path).to eq('/ldapadmin/privateui/')
    expect(page).to have_title 'LDAPadmin - geOrchestra'
    expect(page).to have_css '#new_user'
    expect(page).to have_css '#new_group'
  end
end


