isLoaded = false

$(window).on "load", (e) ->
  $('main').imagesLoaded ->
    console.log true
    isLoaded = true

$(document).on 'turbolinks:load ready', ->
  checkLoading = setInterval ->
    clearInterval checkLoading
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000