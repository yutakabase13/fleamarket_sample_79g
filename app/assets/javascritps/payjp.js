var form = $("#card__form");
  Payjp.setPublicKey("pk_test_d51186afdfe6ca64ffe09a80");

  $("#submit_btn").on("click",function(e){
    e.preventDefault();
    var card = {
      number: $("#card_number").val(),
      cvc: $("#card_cvc").val(),
      exp_month: $("#card_month").val(),
      exp_year: $("#card_year").val()
    };
    Payjp.createToken(card,function(status,response){
      form.find("input[type=submit]").prop("disabled", true);
      if(status == 200){
        $("#card_number").removeAttr("name");
        $("#card_cvc").removeAttr("name");
        $("#card_month").removeAttr("name");
        $("#card_year").removeAttr("name");
        var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
        form.append(payjphtml);
        document.inputForm.submit();
      }else{
        alert("カード情報が正しくありません。");
      }
  });
});