# Is called in _loader.coffee
$.fn.isHalf = ->
  @hasClass('item--half')

@workImageGrimInit = ->
  grid = '#js-grid'

  if $(grid).length
    grid = new Muuri grid,
      layout:
        fillGaps: true
        rounding: false

    grid.layout true, ->
      grid.synchronize()
      TweenLite.defaultOverwrite = false
      controller = new ScrollMagic.Controller

      items = $('.item')

      if items.length > 1
        items = items.not('.item--not-animate')

        items.each (i, el) ->
          img = $(el).find('.item__img')
          offset = if $(el).prev('.item:not(.item--not-animate)').isHalf() and $(el).isHalf()
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
    window.grid = grid