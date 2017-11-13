isLoaded = false

$(window).on 'load', ->
  isLoaded = true

$ ->
  checkLoading = setInterval ->
    clearInterval checkLoading
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000

  $('a:not(.skip-preloader)').on 'click', (e) ->
    TweenMax.to('body', 0.3, opacity: 0)