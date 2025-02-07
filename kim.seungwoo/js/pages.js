
const resultQuery = async (options) => {
   // destructure
   let {result,error} = await query(options);
   if(error) {
      throw(error);
      return;
   }
   return result;
}


const ListPage = async() => {
      let restrooms = await resultQuery({
         type:'restrooms_by_user_id',
         params:[sessionStorage.userId]
      }); 

   makeRestroomListSet(restrooms);
}

const HomePage = async() => {
   let result = await resultQuery({
      type:'home_restroom_locations',
      params:[sessionStorage.userId]
   });

   let restrooms = result.reduce((r,o)=>{
      o.icon = o.img;
      if(o.lat && o.lng) r.push(o);
      return r;
   },[]);

   // console.log(restrooms)

   let mapEl = await makeMap("#page-home .map");
   makeMarkers(mapEl,restrooms);

   let {infoWindow,map,markers} = mapEl.data();
   markers.forEach((o,i)=>{
      o.addListener("click",function(){

         // Simple Example
         // sessionStorage.restroomId = restrooms[i].restroom_id;
         // $.mobile.navigate("#page-restroom-profile")

         // Info Window Example
         // infoWindow.open(map,o);
         // infoWindow.setContent(makeRestroomPopup(restrooms[i]))

         // activate example
         $("#home-drawer")
            .addClass("active")
            .find(".modal-body")
            .html(makeRestroomPopup(restrooms[i]))
      })
   });
}

const UserProfilePage = async() => {
   let result = await resultQuery({
      type:'user_by_id',
      params:[sessionStorage.userId]
   });

   let [user] = result;
   $("#page-user-profile [data-role='main']").html(makeUserProfile(user));
}

const UserEditPage = async() => {
   let user_result = await resultQuery({
      type:'user_by_id',
      params:[sessionStorage.userId]
   });

   let [user] = user_result;

   $("#user-edit-form .fill-parent").html(
      makeUserFormInputs(user,"user-edit")
      );
}


const RestroomProfilePage = async() => {
   let restroom_result = await resultQuery({
      type:'restroom_by_id',
      params:[sessionStorage.restroomId]
   });

   let [restroom] = restroom_result;
   $(".restroom-profile-top>img").attr("src",restroom.img);
   $(".restroom-profile-bottom .description").html(makeRestroomProfile(restroom));

   let locations_result = await resultQuery({
      type:'locations_by_restroom_id',
      params:[sessionStorage.restroomId]
   });

   let mapEl = await makeMap("#page-restroom-profile .map");
   makeMarkers(mapEl,locations_result);

}


const RestroomEditPage = async() => {
   let restroom_result = await resultQuery({
      type:'restroom_by_id',
      params:[sessionStorage.restroomId]
   });

   let [restroom] = restroom_result;

   $("#restroom-edit-form .fill-parent").html(
      makeRestroomFormInputs(restroom,"restroom-edit")
      );
}

const RestroomAddPage = async() => {
   $("#restroom-add-form .fill-parent").html(
      makeRestroomFormInputs({
         store:'',
         needs:'',
         type:'',
         description:'',
         password:'',
         

      },"restroom-add")
      );
}

const LocationSetLocationPage = async() => {
   let mapEl = await makeMap("#page-location-set-location .map");
   makeMarkers(mapEl,[]);

   mapEl.data("map").addListener("click",function(e){
      $("#location-lat").val(e.latLng.lat())
      $("#location-lng").val(e.latLng.lng())
      makeMarkers(mapEl,[e.latLng]);

   })
}

const LocationChooseRestroomPage = async() => {
   let result = await resultQuery({
      type:'restrooms_by_user_id',
      params:[sessionStorage.userId]
   });

   console.log(result)

   $(".location-restroom-choice-select").html(
      makeRestroomChoiceSelect({
         restrooms:result,
         store:'location-restroom-choice-select'
      })
   );
   $("#location-restroom-choice").val(result[0].id);
}