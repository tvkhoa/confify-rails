(function(){
  // $('#search-button').click( function(e){
  //   $(this).parent('form').submit();
  // });

  $('.love-button').click( function (e){
    if ( $(this).hasClass( 'disable' ) ) {
      e.preventDefault();
    } else{
      $(this).parent('form').submit();
      $(this).addClass( 'disable' );
    } 
  });

  $('.approve-button').click( function (e){
    if ( $(this).hasClass( 'disable' ) ) {
      e.preventDefault();
    } else{
      $(this).addClass( 'disable' );
    }
  });

  $('.admin_edit_locale').click( function (e){
    $(this).prev().show();
    $(this).prev().prev().hide();
    $(this).hide();
    return false;
  });

  $('.admin_cancel_locale').click( function (e){
    var $form = $(this).closest('form');
    $form.hide();
    $form.prev().show();
    $form.next().show();
    return false;
  });


  $('.hover-admin').hover(
    function(){
      $(this).find('.edit-links').removeClass('hide');
    }, function(){
      $(this).find('.edit-links').addClass('hide');
    }
  )

  $('.upload-cloud').click( function (){
    $(this).next().trigger('click');
  });
  $('.hide-file-field').change(function (){
    $(this).next().html($(this).val());
  });

  $('.update-banner').click( function (){
    $('#banner-loading').removeClass('hide');
    return false;
  });


  $('.switch-button').on('click', Foundation.utils.debounce(function(e){
    $(this).parent('form').submit();
  }, 10, true));

  $('.feedback-btn').on('click', Foundation.utils.debounce(function(e){
    var id = $(this).attr("data-id");
    $('#feedback-form-' + id).removeClass("hide");
    $('#answer-div-' + id).addClass("hide");
  }, 10, true));

  $('.feedback-cancel-btn').on('click', Foundation.utils.debounce(function(e){
    var id = $(this).attr("data-id");
    $('#feedback-form-' + id).addClass("hide");
    $('#answer-div-' + id).removeClass("hide");
  }, 10, true));

  

})();

