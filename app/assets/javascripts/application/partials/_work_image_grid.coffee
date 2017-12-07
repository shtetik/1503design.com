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
        i1_top = i1.getPosition().top
        i2_top = i2.getPosition().top
        i1_left = i1.getPosition().left
        i2_left = i2.getPosition().left

        if i1_top > i2_top or i1_top == i2_top and i1_left > i2_left
          1
        else
          -1

      items = $(i.getElement() for i in items)

      if items.length > 1
        items = items.not('.item--not-animate')
        items.each (i, el) ->
          img = $(el).find('.item__img')
          offset = if i != 0 and items.eq(i - 1).isHalf() and items.eq(i).isHalf()
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
