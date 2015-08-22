feature "Mapfishapp (the viewer)" do

  # Scenario #1: Loading the viewer

  # In the regular configuration, the viewer
  # is accessible even when not connected
  it 'should display the viewer page' do
    visit('/mapfishapp/')
    expect(page).to have_content 'Add layers'
  end

  # Scenario #2: Loading a remote layer

  it 'should load a layer (dem:altitude)' do
    visit('/mapfishapp')
    click_button('Add layers')

    page.find(:xpath, "//span[text()='OGC server']").click
    expect(page).to have_content '.. or enter its address'

    page.find(:xpath, "//label[text()='Choose a server: ']/../div/div/input").click
    page.find(:xpath, "//div[text()='geOrchestra.org demo']").click
    page.find(:xpath, "//b[text()='Altitude : shaded relief']").click
    page.find(:xpath, "//button[text()='Add (1)']").click

    # chrome driver is a bit too fast
    sleep 1
    # check that the layer has been loaded
    altitudeLayerLoaded = false
    page.all(:xpath, "//img").each do |elem|
      next if altitudeLayerLoaded
      next if elem['src'].nil? || elem['src'].empty?
      if elem['src'].include? "LAYERS=dem%3Ahillshading" then
       altitudeLayerLoaded = true
       break
      end
    end
    expect(altitudeLayerLoaded).to be_truthy
  end
end
