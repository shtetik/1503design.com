### ANIMANION ON LANDING PAGE ###
$(document).on 'turbolinks:load', ->

  # SCROLLMAGIC + TWEENMAX
  controller = new ScrollMagic.Controller

  # Arrow
  new ScrollMagic.Scene(triggerElement: '#intro', duration: 200)
    .triggerHook(0)
    .setTween(TweenMax.to('#arrow', 1, { opacity: 0 }))
    .addTo(controller)

  # Text
  $('[data-text-first]').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: '#intro', duration: '50%')
      .triggerHook(0)
      .setTween(TweenMax.to(el, 1, { opacity: 0.3, scale: 1.02, ease: Power1.easeIn }))
      .addTo(controller)

  $('[data-text]').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: el, duration: '50%')
      .triggerHook(1)
      .setTween(TweenMax.to(el, 1, { opacity: 1, ease: Power0.easeNone }))
      .addTo(controller)
    new ScrollMagic.Scene(triggerElement: el, duration: '10%')
      .triggerHook(1)
      .setTween(TweenMax.to(el, 1, { scale: 1, ease: Power0.easeNone }))
      .addTo(controller)


  # # Parallax + Blackout
  # $('[data-section]').each (i, el) ->
  #   hook = if i == 0 then 1 else 0
  #   blackout_tween = TweenMax.fromTo '#blackout', 1,
  #     { opacity: 0, ease: Power1.easeIn }
  #     { opacity: 1, ease: Power1.easeIn }
  #   trigger = "[data-section='#{i + 1 + hook}']"
  #   new ScrollMagic.Scene(triggerElement: trigger, duration: '100%')
  #     .triggerHook(hook)
  #     .setTween(blackout_tween)
  #     .setPin("[data-section='#{i + 1}']", { pushFollowers: false })
  #     .addTo(controller)
  #     .on 'enter leave', (event) ->
  #       if event.state == 'BEFORE' && event.type == 'leave' && event.target.triggerHook() == 1
  #         $('#blackout').css('z-index', 0)
  #     .on 'progress', (event) ->
  #       if event.progress > 0.01
  #         index_delta = if i != 0 then 1 else 0
  #         index = parseInt($(event.target.triggerElement()).css('z-index'))
  #         $('#blackout').css('z-index', index + index_delta)

  duration_first = $('.section--first').height() - $( window ).height()
  new ScrollMagic.Scene(triggerElement: '#intro', duration: duration_first)
    .triggerHook(0)
    .setTween(TweenMax.to(".section--first", 1, { y: -duration_first, ease: Linear.easeNone }))
    .addTo(controller)

  $('[data-section]').each (i, el) ->
    return if i == 0
    offset = duration_first + $( window ).height() * (i - 1)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: offset, duration: $( window ).height())
      .triggerHook(0)
      .setTween(TweenMax.to("[data-section='#{i + 1}']", 1, { y: '-100%', ease: Linear.easeNone }))
      .addTo(controller)

  # SCROLLMAGIC + TYPED.JS
  new ScrollMagic.Scene(triggerElement: '#typed-trigger', reverse: false)
    .addTo(controller)
    .on 'start', ->
      new Typed '#typed',
        strings: ['scenical decorations tailor-made on the client needs.']
        stringsElement: '#typed-strings'
        loop: true
        typeSpeed: 40
        fadeOut: true
        backDelay: 2000
        showCursor: false
