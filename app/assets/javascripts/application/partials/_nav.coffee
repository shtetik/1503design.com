$ ->
  canOpen = true
  canClose = false
  isMouseleave = false

  logo = $('.logo-1618')

  logoHide = ->
    if canClose
      canClose = false
      menu = logo.find('.logo-1618__menu')
      menu.fadeOut 300, ->
        menu.removeClass('logo-1618__menu--show').show()
        canOpen = true
        unless isMouseleave
          logoShow(logo)

  logoShow = ->
    if canOpen
      canOpen = false
      logo.find('.logo-1618__menu').addClass 'logo-1618__menu--show'
      setTimeout ->
        canClose = true
        if isMouseleave
          logoHide(logo)
      , 300

  $('.logo-1618__root').on 'mouseenter', ->
    isMouseleave = false
    logoShow()

  $('.logo-1618').on 'mouseleave', ->
    isMouseleave = true
    logoHide()

  $('.logo-1618 a').on 'click', ->
    logo.find('.logo-1618__menu').hide()
