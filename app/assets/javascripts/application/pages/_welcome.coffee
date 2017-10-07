blackoutTimeline = ->
  timeline = new TimelineLite()
  timeline.add(TweenMax.to('#blackout', 1, { opacity: 1, ease: Linear.easeNone }))
  timeline.set('#blackout', { opacity: 0, zIndex: "+=1" })
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
  durationFirst = $('.section--first').height() - $( window ).height()
  new ScrollMagic.Scene(triggerElement: '#intro', duration: durationFirst)
    .triggerHook(0)
    .setTween(TweenMax.to(".section--first", 1, { y: -durationFirst, ease: Linear.easeNone }))
    .addTo(controller)

  $('[data-section]').each (i, el) ->
    return if i == 0
    offset = durationFirst + $( window ).height() * (i - 1)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: offset, duration: $( window ).height())
      .triggerHook(0)
      .setTween(TweenMax.to("[data-section='#{i + 1}']", 1, { y: '-100%', ease: Linear.easeNone }))
      .addTo(controller)
    new ScrollMagic.Scene(triggerElement: '#intro', offset: offset, duration: $( window ).height())
      .triggerHook(0)
      .setTween(blackoutTimeline())
      .addTo(controller)

  new ScrollMagic.Scene(triggerElement: '.section--quote', duration: $( window ).height())
    .triggerHook(1)
    .setTween(blackoutTimeline())
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

$(document).on 'turbolinks:load', ->
  animanions()
$( window ).resize ->
  reloadWithTurbolinks()
