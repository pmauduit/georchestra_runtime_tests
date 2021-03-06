
def get_geoserver_menu_links
   page.all('ul.navigation-tab-content > li > a').collect do |item|
     [ item[:href], item.find(:xpath, "./span").text ]
   end
end

def test_geoserver_oops_something_went_wrong
   result = []
   get_geoserver_menu_links.each do |elem|
     url = elem[0]
     title = elem[1]
     visit(url)
     result << title if page.title.include? "Oops, something went wrong..."
   end
   result
end

feature "Browsing the geoserver UI" do
  # Scenario #1: not connected
  it 'should show the UI with minimal menu' do
    visit('/cas/logout')
    visit('/geoserver/')
    expect(page).to have_title 'GeoServer: Welcome'
    expect(get_geoserver_menu_links.length).to equal(2)
    failing_pages = test_geoserver_oops_something_went_wrong
    expect(failing_pages).to be_empty, "Current failing GeoServer pages: #{failing_pages.join(', ')}"
  end
  # Scenario #2: logged as testadmin/testadmin
  it 'should show the UI with every menu available if connected as testadmin' do
    visit('/geoserver/?login')
    expect(page).to have_title 'CAS - geOrchestra'
    fill_in "username", :with => "testadmin"
    fill_in "password", :with => "testadmin"
    page.find('input[type="submit"]').click
    expect(page).to have_title 'GeoServer: Welcome'
    failing_pages = test_geoserver_oops_something_went_wrong
    expect(failing_pages).to be_empty, "Current failing GeoServer pages: #{failing_pages.join(', ')}"
  end
end


