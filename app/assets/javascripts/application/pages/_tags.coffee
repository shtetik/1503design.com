$(document).on 'turbolinks:load', ->

  $('.works').imagesLoaded ->
    $grid = $('.works__wrapper').isotope
      itemSelector: '.work'
      transitionDuration: 300

    setFilter = setTimeout ->
      $grid.isotope filter: ".work--#{gon.tag}" if gon.tag?
    , 300

    $('.js-works-filter').on 'click', 'a[data-filter]', (event) ->
      event.preventDefault()
      clearTimeout setFilter
      filterValue = $(@).attr('data-filter')
      $grid.isotope filter: filterValue
      $('.js-works-filter a').removeClass('link--active')
      $(".tags__filter a[data-filter='#{filterValue}']").addClass('link--active')
      history.replaceState(null, null, "/tags/#{filterValue.replace('.work--', '').replace('*', '')}")
