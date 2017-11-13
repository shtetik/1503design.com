isLoaded = false

$(document).on 'turbolinks:load', ->
  $('body').imagesLoaded ->
    isLoaded = true

  checkLoading = setInterval ->
    clearInterval checkLoading
    $('body').removeClass('loading')
    $('.loader').fadeOut(300)
  , 1000