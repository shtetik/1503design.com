$ ->
  $('#footer__arrow').click ->
    TweenLite.to(window, 1, { scrollTo: 0, ease: Expo.easeOut })
