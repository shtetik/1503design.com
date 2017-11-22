# Is called in _loader.coffee
@workImageGrimInit = ->
  grid = '#js-grid'

  if $(grid).length
    grid = new Muuri grid,
      layoutOnResize: true
      layout:
        fillGaps: true
        rounding: false

    grid.layout true, ->
      TweenLite.defaultOverwrite = false
      controller = new ScrollMagic.Controller

      items = $('.item')

      if items.length > 1
        first_item = items.first()
        items = items.not(':first')
        if first_item.offset().top == items.first().offset().top
          items = items.not(':first')

        items.each (i, el) ->
          img = $(el).find('.item__img')
          offset = if $(el).prev().offset().top == $(el).offset().top
            250
          else
            150
          new ScrollMagic.Scene(triggerElement: el, offset: offset)
            .triggerHook(1)
            .setTween(
              TweenMax.fromTo(
                img, 0.3,
                { y: 100, opacity: 0 },
                { y: 0, opacity: 1 },
                ease: Power4.easeOut
              )
            )
            .reverse(false)
            .addTo(controller)
