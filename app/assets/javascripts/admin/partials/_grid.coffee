$ ->
  grid = '#js-grid'

  if $(grid).length
    $(grid).imagesLoaded ->
      $(grid).find('.item').css 'position', 'absolute'
      $(grid).show()
      grid = new Muuri grid,
        dragEnabled: true
        dragSortInterval: 50
        layoutOnResize: true
        layout:
          fillGaps: true
          rounding: false

      grid.on 'dragReleaseEnd', ->
        updateImagePositions()

      updateImagePositions = ->
        image_positions = {}
        grid.getItems().forEach (item, i) ->
          image_positions[item.getElement().getAttribute 'data-id'] = i + 1
        $('#work_image_positions').val JSON.stringify(image_positions)
