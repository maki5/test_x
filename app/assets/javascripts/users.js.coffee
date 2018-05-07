jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      console.log(url)
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $.getScript(url)
    $(window).scroll()

