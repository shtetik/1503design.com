$(document).on 'turbolinks:load', ->

  $('.works').imagesLoaded ->
    $grid = $('.works__wrapper').isotope
      itemSelector: '.work'
      transitionDuration: 300

    $('.tags__filter').on 'click', 'a', (event) ->
      event.preventDefault()
      filterValue = $(@).attr('data-filter')
      $grid.isotope filter: filterValue
