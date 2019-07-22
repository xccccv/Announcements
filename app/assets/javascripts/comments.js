$('#btn_new_comment').on('click', function(e) { 
    $.ajax({
        type: "POST",
        url: "/comments"
      })
        $("#new_comment")
        .bind("ajax:success", function(){
          console.log('comment: success');
        })
        .bind("ajax:error", function(){
          console.log('comment: error');
        });
    })