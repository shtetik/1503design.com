isLoaded = false

window.onload = ->
  isLoaded = true

$ ->
  checkLoading = setInterval ->
    if isLoaded
      clearInterval checkLoading
      @workImageGrimInit()
      $('body').removeClass('loading')
      $('.loader').fadeOut(300)
  , 1000

  $("a:not(.skip-preloader):not([target='_blank'])").on 'click', (e) ->
    TweenMax.to('body', 0.3, opacity: 0)