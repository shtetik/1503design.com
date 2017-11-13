isLoaded = false

$(window).on "load", (e) ->
  $('main').imagesLoaded ->
    isLoaded = true

$(document).on 'turbolinks:load', ->
  checkLoading = setInterval ->
    clearInterval checkLoading
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000