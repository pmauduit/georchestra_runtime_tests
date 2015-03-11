feature "Mapfishapp (the viewer)" do
  it 'should display viewer page' do
    visit('/mapfishapp/')
    expect(page).to have_content 'Add layers'
  end
  it 'should load a layer (dem:altitude)' do
    visit('/mapfishapp')
    click_button('Add layers')

    page.find(:xpath, "//span[text()='OGC server']").click
    expect(page).to have_content '.. or enter its address'

    page.find(:xpath, "//label[text()='Choose a server: ']/../div/div/input").click
    page.find(:xpath, "//div[text()='geOrchestra.org demo']").click
    page.find(:xpath, "//b[text()='Altitude : shaded relief']").click
    page.find(:xpath, "//button[text()='Add (1)']").click

    # check that the layer has been loaded
    altitudeLayerLoaded = false
    page.all(:xpath, "//img").each do |elem|
      next if altitudeLayerLoaded
      if elem['src'].include? "LAYERS=dem%3Aaltitude" then
       altitudeLayerLoaded = true
       break
      end
    end
    expect(altitudeLayerLoaded).to be_truthy
  end
end
