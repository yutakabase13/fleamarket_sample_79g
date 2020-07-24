$(function () {
  $(".Dropdwn__list-top").hover(
    function () {
      $("ul:not(:animated)", this).slideDown();
    },
    function () {
      $(".Dropdwn__menu", this).slideUp();
    }
  );
});
