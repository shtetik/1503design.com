$(document).on 'turbolinks:load', ->
  $('#scroll-top').click ->
    TweenLite.to(
      window
      $( document ).height() / 1500
      { scrollTo: 0, ease: Expo.easeOut }
    )