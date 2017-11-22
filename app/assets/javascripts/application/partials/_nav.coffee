$ ->
  scrollPosition = null
  canOpen = true
  canClose = false
  isMouseleave = false

  menu = $('.nav__menu')

  allowScroll = ->
    $('html').removeClass('not-scroll')
    $(window).scrollTop(scrollPosition)

  popupMobile = ->
    $('.popup').toggleClass 'popup--mobile', Modernizr.mq('screen and (max-width:768px)')

  logoHide = ->
    if canClose
      canClose = false
      popup = menu.find('.popup')
      popup.fadeOut 300, ->
        popup.removeClass('popup--show').show()
        canOpen = true
        unless isMouseleave
          logoShow(menu)

  logoShow = ->
    if canOpen
      canOpen = false
      menu.find('.popup').addClass 'popup--show'
      setTimeout ->
        canClose = true
        if isMouseleave
          logoHide(menu)
      , 300

  $('.nav__logo').on 'mouseenter', ->
    isMouseleave = false
    logoShow()

  $('.nav__menu').on 'mouseleave', ->
    isMouseleave = true
    logoHide()

  $('.nav__menu a').on 'click', ->
    allowScroll()
    menu.find('.popup').hide()

  $('.nav__button').on 'click', ->
    scrollPosition = $(window).scrollTop()
    $('.popup').addClass('popup--show').show()
    $('html').addClass('not-scroll')

  $('.popup__close').on 'click', ->
    allowScroll()
    $('.popup').removeClass('popup--show').show()

  popupMobile()

  $(window).resize ->
    popupMobile()
