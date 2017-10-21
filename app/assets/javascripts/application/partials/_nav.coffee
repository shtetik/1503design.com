$(document).on 'turbolinks:load', ->
  canOpen = true
  canClose = false
  isMouseleave = false

  logoHide = (logo) ->
    if canClose
      canClose = false
      menu = logo.find('.logo-1618__menu')
      menu.fadeOut 300, ->
        menu.removeClass('logo-1618__menu--show').show()
        canOpen = true
        unless isMouseleave
          logoShow(logo)

  logoShow = (logo) ->
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
    logoShow($(@).parent())

  $('.logo-1618').on 'mouseleave', ->
    isMouseleave = true
    logoHide($(@))
