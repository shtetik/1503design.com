isLoaded = false

$(window).on 'load', ->
  console.log 'window load'
  $('main').imagesLoaded ->
    console.log 'imagesLoaded'
    isLoaded = true

$ ->
  checkLoading = setInterval ->
    clearInterval checkLoading
    @workImageGrimInit()
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000

  $("a:not(.skip-preloader):not([target='_blank'])").on 'click', (e) ->
    TweenMax.to('body', 0.5, opacity: 0)