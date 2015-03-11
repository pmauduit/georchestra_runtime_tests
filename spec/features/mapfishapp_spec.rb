feature "Mapfishapp (the viewer)" do
  it 'should display viewer page' do
    visit('/mapfishapp/')
    expect(page).to have_content 'Add layers'
  end
  it 'should load a layer' do
    visit('/mapfishapp')
    click_button('Add layers')

    page.find(:xpath, "//span[text()='OGC server']").click
    expect(page).to have_content '.. or enter its address'

  end
end
