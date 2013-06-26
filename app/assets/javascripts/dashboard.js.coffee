$(document).ready(->
  $("a.show-characters").on 'click', (e) ->
    $(this).next().slideToggle('slow')
    console.log("show characters")
)
