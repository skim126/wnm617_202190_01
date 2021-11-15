
const ListPage = async() => {
	//destructure
	let {result,error} = await query({type:'restrooms_by_user_id',params:[sessionStorage.userId]});

	if(error) {
		console.log(error);
		return;
	}

	console.log(result,error);

	$("#page-list .restroomlist").html(makeRestroomList(result));
}

const RecentPage = async() => {
	console.log("honk");
}

const UserProfilePage = async() => {
   let {result,error} = await query({type:'user_by_id',params:[sessionStorage.userId]});
   if(error) {
      console.log(error);
      return;
   }
   let [user] = result;
   $("#page-user-profile [data-role='main']").html(makeUserProfile(user));
}


const RestroomProfilePage = async() => {
   let {result,error} = await query({type:'restroom_by_id',params:[sessionStorage.restroomId]});
   if(error) {
      console.log(error);
      return;
   }
   let [restroom] = result;
   $(".restroom-profile-top img").attr("src",restroom.img);
}