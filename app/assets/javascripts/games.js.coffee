# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(document).ready ->
  # Total amount of purchased dollars
  calculated_value = 0

  $("[data-purchase-price]").each ->
    if $(this).html() == "--"
      calculated_value += 0
    else
      calculated_value += Number($(this).html().replace(/[^0-9\.]+/g, ""))
    return
  $("[data-total-purchase]").html "$" + calculated_value.toFixed(2)


  # Init date picker
  $("[data-date-picker]").datepicker()
  $(".js-date-picker").datepicker()

  $('body').on 'hidden.bs.modal', '#edit-modal', ->
    $(this).removeData 'bs.modal'

    # When the modal is closed, remove the remote data and add back a spinner
    $('.modal-content', this).empty()
    $('.modal-content', this).append ->
      "<div class='loading-spinner f-xl'><span class='fa fa-spinner'></span></div>"

  $('body').on 'loaded.bs.modal', '#edit-modal', ->
    # Init date picker
    $("[data-date-picker]").datepicker()

    # Init Attachinary file upload for Cloudinary
    $('.attachinary-input').attachinary()

    # For checkbox buttons, auto add the "current" class and update when changed
    $("input:checked").parent(".btn").addClass("current")
    $("input[type='checkbox'], input[type='radio']").change ->
      $(this).closest(".btn-group").children(".btn").removeClass("current")
      $(this).parent(".btn").addClass("current")

    # Click thumbnails to change the medium sized image path
    $("[data-clickable-tiny-thumb]").click (e) ->
      e.preventDefault()
      target = $('[data-thumb-target]')
      thumb_path    = $(this).data("thumb-path")
      full_img_path = $(this).data("full-img-path")
      target.attr("href", full_img_path)
      target.find('img').attr("src", thumb_path)

    # Launches a new modal with the enlarged image
    $('[data-launch-image-modal]').on 'click', (e) ->
      e.preventDefault()
      $('[data-image-enlarged]').attr 'src', $(this).attr 'href'
      $('#image-modal').modal 'show'

  $("#new_game").on("ajax:error", (e, data, status, xhr) ->
    $("#new_game").render_form_errors('client', data.responseJSON)
  )