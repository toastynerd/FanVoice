$ ->
  $(document).on "click", '.source', ->
    source_id_class = "." + @.id
    if @.id == "all"
      $('.character').show()
      return
    $('.character').hide()
    $(source_id_class).show()

