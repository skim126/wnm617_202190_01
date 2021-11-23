
// Document Ready
$(()=>{

	checkUserId();

   // Event Delegation
   $(document)

   .on("pagecontainerbeforeshow",function(event, ui){
      //Page Routing
      switch(ui.toPage[0].id) {
         case "page-home": HomePage(); break;
         case "page-list": ListPage(); break;
         case "page-user-profile": UserProfilePage(); break;
         case "page-user-edit": UserEditPage(); break;
         case "page-restroom-profile": RestroomProfilePage(); break;
         case "page-restroom-edit": RestroomEditPage(); break;
         case "page-restroom-add": RestroomAddPage(); break;
      }
   })


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

   .on("click", ".restroom-jump",function(e) {
      if(!$(this).data("id")) throw("No ID on Element");
      sessionStorage.restroomId = $(this).data("id");
      $.mobile.navigate("#page-restroom-profile");
   })


   .on("click",".restroom-profile-middle li",function(e){
      let id = $(this).index();
      $(this).addClass("active")
         .siblings().removeClass("active");
      $(this).closest(".restroom-profile-middle").next().children().eq(id).addClass("active")
         .siblings().removeClass("active");
   })

   .on("click","[data-setnavigateback]",function(e){
      $("#location-navigateback").val($(this).data("setnavigateback"))
   })

   .on("click",".js-navigate-back",function(e){
      window.history.go(+$("#location-navigateback").val());
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
      $(target).addClass("active").siblings().removeClass('active');
   })   
   ;

   $("[data-template]").each(function(){
      let target = $(this).data("template");
      $(this).html($(target).html());
   })

});

