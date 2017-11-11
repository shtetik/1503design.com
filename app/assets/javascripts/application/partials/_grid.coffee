$ ->
  grid = '#js-grid'

  if $(grid).length
    $(grid).imagesLoaded ->
      $(grid).find('.item').css 'position', 'absolute'
      new Muuri grid,
        layoutOnResize: true
        layout:
          fillGaps: true
          rounding: false
