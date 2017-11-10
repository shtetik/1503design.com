$(document).on 'turbolinks:load', ->
  Mousetrap.bind ['a d m i n', 'ф в ь ш т'], ->
    window.location = '/admin'