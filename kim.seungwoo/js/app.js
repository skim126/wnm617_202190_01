
// Document Ready
$(()=>{

	checkUserId();

   // Event Delegation
   $(document)

   // Form Submits
   .on("submit","#signin-form",function(e) {
      e.preventDefault();
      checkSigninForm();
   })
   .on("submit","#list-add-form",function(e) {
      e.preventDefault();
   })

   //Anchor Clicks
   .on("click",".js-logout",function(e) {
      e.preventDefault();
      sessionStorage.removeItem("userId");
      checkUserId();
   })


   .on("click","[data-activate]",function(e){
      let target = $(this).data("activate");
      $(target).addClass("active");
   })
   .on("click","[data-deactivate]",function(e){
      let target = $(this).data("deactivate");
      $(target).removeClass("active");
   })
   .on("click","[data-toggle]",function(e){
      let target = $(this).data("toggle");
      $(target).toggleClass("active");
   })
   .on("click","[data-activateone]",function(e){
      let target = $(this).data("activateone");
      console.log(target)
      $(target).addClass("active").siblings().removeClass('active');
   })   
   ;

   $("[data-template]").each(function(){
      let target = $(this).data("template");
      $(this).html($(target).html());
   })

});

