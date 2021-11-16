
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
   let result = await resultQuery({
      type:'restrooms_by_user_id',
      params:[sessionStorage.userId]
   });

	console.log(result);

	$("#page-list .restroomlist").html(makeRestroomList(result));
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

}

const UserProfilePage = async() => {
   let result = await resultQuery({
      type:'user_by_id',
      params:[sessionStorage.userId]
   });

   let [user] = result;
   $("#page-user-profile [data-role='main']").html(makeUserProfile(user));
}


const RestroomProfilePage = async() => {
   let restroom_result = await resultQuery({
      type:'restroom_by_id',
      params:[sessionStorage.restroomId]
   });

   let [restroom] = restroom_result;
   $(".restroom-profile-top img").attr("src",restroom.img);
   $(".restroom-profile-bottom .description").html(restroom.description);

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
   $(".restroom-profile-top img").attr("src",restroom.img);

   $("#restroom-edit-name").val(restroom.name);
   $("#restroom-edit-password").val(restroom.password);
   $("#restroom-edit-info").val(restroom.sex);

}