$ ->
  # Mobile filter menu
  do
    filterMobile = ->
      $('.filter').toggleClass 'filter--mobile', Helpers.isMobileWidth()

  $('.tags__link').on 'click', ->
    event.preventDefault()
    $('.filter').addClass('filter--show')
    $('html').addClass('not-scroll')

  $('.filter__item a, .filter__close').on 'click', ->
    $('html').removeClass('not-scroll')
    $('.filter').removeClass('filter--show').scrollTop(0)

  # Filter animation
  filterLinks = $('.filter__item a')

  filterLinks.on 'click', ->
    event.preventDefault()
    self = $(@)
    url = self.attr('href')

    return if self.hasClass('link--active')

    $('.tags__link').text(self.text()).attr('href', url)

    TweenMax.killAll()

    filter = self.data().filter

    filterLinks.removeClass('link--active')
    self.addClass('link--active')

    window.history.replaceState null, null, url

    TweenMax.to('.tags-work', 0.3, { opacity: 0, onComplete: ->
      $('.tags-work').hide 0, ->
        displayedWork = $("[data-filters~='#{filter}']").show 0, ->
          TweenMax.staggerTo(displayedWork, 0.4, { opacity: 1, ease: Power4.easeIn }, 0.15)
     })

  # Change mobile filter menu after resize
  $(window).on 'resize', ->
    filterMobile()
