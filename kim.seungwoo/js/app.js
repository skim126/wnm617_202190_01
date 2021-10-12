
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

   //Anchor Clicks
   .on("click",".js-logout",function(e) {
      e.preventDefault();
      sessionStorage.removeItem("userId");
      checkUserId();
   })

});

