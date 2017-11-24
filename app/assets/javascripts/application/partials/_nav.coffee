$ ->
  canOpen = !Helpers.isMobileWidth()
  canClose = false
  isMouseleave = false
  scrollPosition = null

  menu = $('.nav__menu')

  allowScroll = ->
    $('html').removeClass('not-scroll')
    $(window).scrollTop(scrollPosition)

  popupMobile = ->
    $('.popup').toggleClass 'popup--mobile', Helpers.isMobileWidth()
    canOpen = !Helpers.isMobileWidth()

  menuHide = ->
    if canClose
      canClose = false
      popup = menu.find('.popup')
      popup.fadeOut 300, ->
        popup.removeClass('popup--show').show()
        canOpen = true
        unless isMouseleave
          menuShow(menu)

  menuShow = ->
    if canOpen
      canOpen = false
      menu.find('.popup').addClass 'popup--show'
      setTimeout ->
        canClose = true
        if isMouseleave
          menuHide(menu)
      , 300

  $('.nav__logo').on 'mouseenter', ->
    isMouseleave = false
    menuShow()

  $('.nav__menu').on 'mouseleave', ->
    isMouseleave = true
    menuHide()

  $('.nav__menu a').on 'click', ->
    allowScroll()
    menu.find('.popup').hide()

  $('.nav__button').on 'click', ->
    scrollPosition = $(window).scrollTop()
    $('.popup').addClass('popup--show').show()
    $('html').addClass('not-scroll')

  $('.popup__close').on 'click', ->
    allowScroll()
    $('.popup').removeClass('popup--show').scrollTop(0)

  popupMobile()

  $(window).resize ->
    popupMobile()
