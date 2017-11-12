$ ->
  grid = '#js-grid'

  if $(grid).length
    $(grid).imagesLoaded ->
      $('.item').css 'position', 'absolute'
      grid = new Muuri grid,
        layoutOnResize: true
        layout:
          fillGaps: true
          rounding: false

      controller = new ScrollMagic.Controller

      $('.item:not(:first)').each (i, el) ->
        img = $(el).find('.item__img')
        offset = if $(el).prev().offset().top == $(el).offset().top
          250
        else
          150
        new ScrollMagic.Scene(triggerElement: el, offset: offset, duration: 0)
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
