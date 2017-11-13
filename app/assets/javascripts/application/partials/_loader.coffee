isLoaded = false

$(window).on "load", (e) ->
  isLoaded = true

$(document).on 'turbolinks:load', ->
  checkLoading = setInterval ->
    clearInterval checkLoading
    workImageGridInit()
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000