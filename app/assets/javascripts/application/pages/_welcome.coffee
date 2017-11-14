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
    new ScrollMagic.Scene(triggerElement: '#intro', duration: '60%')
      .triggerHook(0)
      .setTween(TweenMax.to(el, 1, { opacity: 0.3, scale: 0.96, ease: Power1.easeIn }))
      .addTo(controller)

  scroll = $(window).scrollTop()
  info_height = $('.section--info').height()
  info_top = $('.section--info').offset().top - scroll

  dataTextDurations = $('[data-text]').map (i, el) ->
    el_height = $(el).height()
    el_top = $(el).offset().top - scroll
    info_top + info_height - el_top - el_height

  dataTextOffsets = $('[data-text]').map (i, el) ->
    info_top + info_height - dataTextDurations[i] - $(el).height()

  $('[data-text]').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: '#intro', offset: dataTextOffsets[i], duration: dataTextDurations[i])
      .triggerHook(1)
      .setTween(TweenMax.to(el, 1, { opacity: 1, ease: Power0.easeNone }))
      .addTo(controller)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: dataTextOffsets[i], duration: dataTextDurations[i])
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

  # Quote
  $('.js-pretyped').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: el, offset: 50, duration: '120%')
      .triggerHook(1)
      .setTween(TweenMax.fromTo(el, 1, { opacity: 0.1 }, { opacity: 1, repeat: 1, yoyo: true }))
      .addTo(controller)

  # Clients
  clientsTitle = $('#clients h2')
  new ScrollMagic.Scene(triggerElement: clientsTitle[0], duration: $( window ).height() + clientsTitle.height())
    .triggerHook(1)
    .setTween(TweenMax.fromTo(clientsTitle[0], 1, { scale: 0.98, opacity: 0.1 }, { scale: 1, opacity: 1, repeat: 1, yoyo: true }))
    .addTo(controller)

  $('.client').each (i, el) ->
    new ScrollMagic.Scene(triggerElement: el, duration: 250)
      .triggerHook(0.98)
      .setTween(TweenMax.fromTo(el, 1, { y: 35, opacity: 0.3 }, { y: 0, opacity: 1 }))
      .addTo(controller)

    delimiter = $(el).find('.client__delimiter')[0]
    new ScrollMagic.Scene(triggerElement: delimiter, duration: 120)
      .triggerHook(0.98)
      .setTween(TweenMax.fromTo(delimiter, 1, { y: 6 }, { y: 0 }))
      .addTo(controller)

    work = $(el).find('.client__work')[0]
    new ScrollMagic.Scene(triggerElement: work, duration: 125)
      .triggerHook(0.98)
      .setTween(TweenMax.fromTo(work, 1, { y: 12 }, { y: 0 }))
      .addTo(controller)

    new ScrollMagic.Scene(triggerElement: el, duration: '40%')
      .triggerHook(0.3)
      .setTween(TweenMax.to(el, 1, { scale: 0.98, opacity: 0.1 }))
      .addTo(controller)

  # Contact
  contactTitle = $('#contact h2')
  new ScrollMagic.Scene(triggerElement: contactTitle[0], duration: '60%')
    .triggerHook(1)
    .setTween(TweenMax.fromTo(contactTitle[0], 1, { scale: 0.98, opacity: 0.1 }, { scale: 1, opacity: 1 }))
    .addTo(controller)

  mailUs = $('.text--contact__mail-us')
  new ScrollMagic.Scene(triggerElement: mailUs[0], duration: '60%')
    .triggerHook(1)
    .setTween(TweenMax.fromTo(mailUs[0], 1, { scale: 0.98, opacity: 0 }, { scale: 1, opacity: 1 }))
    .addTo(controller)

  mail = $('.text--contact__mail')
  new ScrollMagic.Scene(triggerElement: mail[0], duration: '50%')
    .triggerHook(1)
    .setTween(TweenMax.fromTo(mail[0], 1, { scale: 0.98, opacity: 0 }, { scale: 1, opacity: 1 }))
    .addTo(controller)

  info = $('.text--contact__info')
  new ScrollMagic.Scene(triggerElement: info[0], duration: '30%')
    .triggerHook(1)
    .setTween(TweenMax.fromTo(info[0], 1, { scale: 0.99, opacity: 0 }, { scale: 1, opacity: 1 }))
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

  # CLIENTS AND CONTACT SCROLL
  $('#clients-scroll, #contact-scroll').click (event) ->
    event.preventDefault()
    TweenLite.to(window, 1, { scrollTo: "##{event.target.id.replace('-scroll', '')}", ease: Expo.easeOut })

$ ->
  if $('#intro').length
    animanions()
