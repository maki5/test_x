jQuery ->
  $('.edit_user').click (event)->

    event.preventDefault()
    edit_id = $(this).attr("data-id")
    $("#" + edit_id).show()
    return


  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Please Wait...");
        $.getScript(url)
    $(window).scroll()


