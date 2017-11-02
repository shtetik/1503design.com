blackoutTimeline = (reset = true) ->
  timeline = new TimelineLite()
  timeline.add(TweenMax.to('#blackout', 1, { opacity: 1, ease: Power1.easeIn }))
  timeline.set('#blackout', { opacity: 0, zIndex: "+=1" }) if reset
  timeline

### ANIMANION ON LANDING PAGE ###
animanions = ->
  # SCROLLMAGIC + TWEENMAX
  controller = new ScrollMagic.Controller

  # Arrow
  new ScrollMagic.Scene(triggerElement: '#intro', duration: 200)
    .triggerHook(0)
    .setTween(TweenMax.to('#arrow', 1, { opacity: 0 }))
    .addTo(controller)
  new ScrollMagic.Scene(triggerElement: '#intro', offset: 200)
    .triggerHook(0)
    .setClassToggle('#arrow', 'arrow--hide')
    .addTo(controller)

  $('#arrow').click ->
    TweenLite.to(window, 1, { scrollTo: $( window ).height(), ease: Expo.easeOut })

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

  # Parallax + Blackout
  firstHeight = $('.section--first').height()
  introPadding = firstHeight + $( window ).height() * $('[data-section]').length

  $('#intro').css 'padding-top', introPadding

  new ScrollMagic.Scene(triggerElement: '#intro', duration: firstHeight)
    .triggerHook(0)
    .setTween(TweenMax.to('.section--first, .section--info', 1, { y: -firstHeight, ease: Linear.easeNone }))
    .addTo(controller)

  $('[data-section]').each (i, el) ->
    return if i == 0
    offset = firstHeight + $( window ).height() * (i - 1)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: offset, duration: '100%')
      .triggerHook(0)
      .setTween(TweenMax.to("[data-section='#{i + 1}']", 1, { y: '-100%', ease: Linear.easeNone }))
      .addTo(controller)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: offset, duration: '100%')
      .triggerHook(0)
      .setTween(blackoutTimeline())
      .addTo(controller)

  new ScrollMagic.Scene(triggerElement: '.section--quote', duration: '100%')
    .triggerHook(1)
    .setTween(blackoutTimeline(false))
    .addTo(controller)

  new ScrollMagic.Scene(triggerElement: '.section--quote', offset: 300, duration: '100%')
    .triggerHook(0)
    .setTween('[data-section]', 1, { y: '-200%' })
    .addTo(controller)

  # Clients
  $('.client').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: el, duration: 250)
      .triggerHook(0.98)
      .setTween(TweenMax.fromTo(el, 1, { y: 35, opacity: 0.3 }, { y: 0, opacity: 1 }))
      .addTo(controller)

  # SCROLLMAGIC + TYPED.JS
  new ScrollMagic.Scene(triggerElement: '#typed-trigger', reverse: false)
    .addTo(controller)
    .on 'start', ->
      try
        new Typed '#typed',
          strings: ['scenical decorations tailor-made on the client needs.']
          stringsElement: '#typed-strings'
          loop: true
          typeSpeed: 40
          fadeOut: true
          backDelay: 2000
          showCursor: false

  # Clients and Contact scroll
  $('#clients-scroll, #contact-scroll').click (event) ->
    event.preventDefault()
    TweenLite.to(window, 1, { scrollTo: "##{event.target.id.replace('-scroll', '')}", ease: Expo.easeOut })

$(document).on 'turbolinks:load', ->
  if $('#intro').length
    animanions()
