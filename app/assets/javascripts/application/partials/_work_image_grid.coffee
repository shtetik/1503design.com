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
      TweenLite.defaultOverwrite = false
      controller = new ScrollMagic.Controller

      items = grid.getItems()
      items = items.sort (i1, i2) ->
        if i1.getPosition().top > i2.getPosition().top or i1.getPosition().left > i2.getPosition().left
          1
        else
          -1

      items = items.map (i) ->
        i.getElement()

      items = $(items)

      if items.length > 1
        items = items.not('.item--not-animate')

        items.each (i, el) ->
          img = $(el).find('.item__img')
          offset = if i != 0 and items.eq(i - 1).isHalf() and $(el).isHalf()
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
