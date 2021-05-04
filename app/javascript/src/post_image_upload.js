$(document).on("change", "#post_image_upload", function(e) {
  if (e.target.files.length) {
    let reader = new FileReader;
    reader.onload = function(e) {
      $('.hidden').removeClass();
      $('.img').hide();
      $('.post-default-img').removeClass();
      $('#post-img').remove();
      $('#post-img-prev').attr('src', e.target.result);
    };
    return reader.readAsDataURL(e.target.files[0]);
  }
});
