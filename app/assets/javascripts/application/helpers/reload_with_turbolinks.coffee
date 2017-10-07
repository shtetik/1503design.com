@reloadWithTurbolinks = ->
  scrollPosition = null

  reload = ->
    scrollPosition = [
      window.scrollX
      window.scrollY
    ]
    Turbolinks.visit window.location.toString(), action: 'replace'

  $(document).on 'turbolinks:load', ->
    if scrollPosition?
      window.scrollTo.apply window, scrollPosition
      scrollPosition = null

  reload