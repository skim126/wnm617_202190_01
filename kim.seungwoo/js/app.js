
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
         case "page-location-choose-restroom": LocationChooseRestroomPage(); break;
         case "page-location-set-location": LocationSetLocationPage(); break;
      }
   })


   // Form Submits
   .on("submit","#signin-form",function(e) {
      e.preventDefault();
      checkSigninForm();
   })

   .on("submit", "#signup-form", function(e) {
      e.preventDefault();
      checkSignup();
   })

   .on("submit", "#signup-form2", function(e) {
      e.preventDefault();
      checkSignup2();
   })

   .on("submit","#list-add-form",function(e) {
      e.preventDefault();
   })

   .on("submit", "#restroom-add-form", function(e) {
      e.preventDefault();
      restroomAddForm();
   })

   .on("submit", "#restroom-edit-form", function(e) {
      e.preventDefault();
      restroomEditForm();
   })

   .on("submit", "#list-search-form", function(e) {
      e.preventDefault();
      let s = $(this).find("input").val();
      checkSearchForm(s);
   })


   //Form Anchor Clicks
   .on("click",".js-submituseredit",function(e) {
      e.preventDefault();
      userEditForm();
   })

   .on("click",".js-submituserpassword",function(e) {
      e.preventDefault();
      userEditPasswordForm();
   })

   .on("click",".js-submitlocationform",function(e){
      e.preventDefault();
      locationAddForm();
   })

   .on("click","[data-filter]",function(e){
      let {filter,value}= $(this).data();
      if(value=="") ListPage();
      else checkFilter(filter,value);
   })

   .on("change",".image-picker input",function(e){
      checkUpload(this.files[0])
      .then(d=>{
         console.log(d);
         $(this).parent().prev().val("uploads/"+d.result);
         $(this).parent().css({
            "background-image":`url(uploads/${d.result})`
         });
      })
   })

   .on("click",".js-submituserupload",function(e) {
      let image = $("#user-upload-filename").val();
      query({
         type:"update_user_image",
         params: [image,sessionStorage.userId]
      }).then(d=>{
         if(d.error) throw(d.error);

         history.go(-1);
      })
   })

   .on("click",".js-submitrestroomupload",function(e) {
      let image = $("#restroom-upload-filename").val();
      query({
         type:"update_restroom_image",
         params: [image,sessionStorage.restroomId]
      }).then(d=>{
         if(d.error) throw(d.error);

         history.go(-1);
      })
   })

   .on("click",".js-restroom-delete",function(e){
      query({
         type:"delete_restroom",
         params: [sessionStorage.restroomId]
      }).then(d=>{
         history.go(-2);
      })
   })


   // on change

   .on("change","#location-restroom-choice-select",function(e){
      console.log(this.value)
      $("#location-restroom-choice").val(this.value)
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

   .on("click",".js-chooserestroom",function(e){
      $("#location-restroom-choice").val(sessionStorage.restroomId);
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

