# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(document).ready ->
  $("[data-date-picker]").datepicker()
  $(".js-date-picker").datepicker()

  $('body').on 'hidden.bs.modal', '.modal', ->
    $(this).removeData 'bs.modal'
    $('.modal-content', this).empty()
    $('.modal-content', this).append ->
      "<div class='loading-spinner f-xl'><span class='fa fa-spinner'></span></div>"

  $('body').on 'loaded.bs.modal', '.modal', ->
    $("[data-date-picker]").datepicker()
    $('.attachinary-input').attachinary()
    $("[data-clickable-tiny-thumb]").click (e) ->
      e.preventDefault()
      target = $('[data-thumb-target]')
      thumb_path    = $(this).data("thumb-path")
      full_img_path = $(this).data("full-img-path")
      target.attr("href", full_img_path)
      target.find('img').attr("src", thumb_path)

  $("#new_game").on("ajax:error", (e, data, status, xhr) ->
    $("#new_game").render_form_errors('client', data.responseJSON)
  )