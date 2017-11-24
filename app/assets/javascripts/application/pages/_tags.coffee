$ ->
  filterMobile = ->
    $('.filter').toggleClass 'filter--mobile', Helpers.isMobileWidth()

  $('.tags__button').on 'click', ->
    $('.filter').addClass('filter--show')
    $('html').addClass('not-scroll')

  $('.filter__close').on 'click', ->
    $('html').removeClass('not-scroll')
    $('.filter').removeClass('filter--show').scrollTop(0)

  filterMobile()

  $(window).resize ->
    filterMobile()