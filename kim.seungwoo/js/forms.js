
const restroomAddForm = async () => {
	let store = $("#restroom-add-store").val();
	let type = $("#restroom-add-type").val();
	let needs = $("#restroom-add-needs").val();
	let description = $("#restroom-add-description").val();
	let password = $("#restroom-add-password").val();

	let r = await query ({
		type:'insert_restroom',
		params:[sessionStorage.userId,store,type,needs,description,password]
	});

	if(r.error) throw(r.error);

	sessionStorage.restroomId = r.id;
	history.go(-1);
}

const restroomEditForm = async () => {
	let store = $("#restroom-edit-store").val();
	let type = $("#restroom-edit-type").val();
	let needs = $("#restroom-edit-needs").val();
	let description = $("#restroom-edit-description").val();
	let password = $("#restroom-edit-password").val();

	let r = await query ({
		type:'update_restroom',
		params:[store,type,needs,description,password,sessionStorage.restroomId]
	});

	if(r.error) throw(r.error);

	history.go(-1);
}

const checkSignup = async () => {
	let email = $("#signup-email").val();
	let username = $("#signup-username").val();
	let password = $("#signup-password").val();
	let confirm = $("#signup-password2").val();

	if(password!=confirm) throw("Passwords don't match");

	let r = await query ({
		type:'insert_user',
		params:[username,email,password]
	});

	if(r.error) throw(r.error);

	sessionStorage.userId = r.id;

	$.mobile.navigate("#page-signup2");
}

const checkSignup2 = async () => {
	let image = $("#signup-image-name").val();
	let name = $("#signup-name").val();

	let r = await query ({
		type:'update_user_onboard',
		params:[image,name,sessionStorage.userId]
	});

	if(r.error) throw(r.error);

	$.mobile.navigate("#page-home");
}

const userEditForm = async () => {
	let name = $("#user-edit-name").val();
	let username = $("#user-edit-username").val();
	let email = $("#user-edit-email").val();

	let r = await query ({
		type:'update_user',
		params:[name,username,email,sessionStorage.userId]
	});

	if(r.error) throw(r.error);

	history.go(-1);
}

const userEditPasswordForm = async () => {
	let password = $("#user-password-initial").val();
	let confirm = $("#user-password-confirm").val();

	if(password!==confirm) throw ("Passwords don't match")

	let r = await query ({
		type:'update_user_password',
		params:[password,sessionStorage.userId]
	});

	if(r.error) throw(r.error);

	history.go(-1);
}

const locationAddForm = async () => {
	let restroom = $("#location-restroom-choice").val();
	let lat = $("#location-lat").val();
	let lng = $("#location-lng").val();
	let description = $("#location-description").val();

	let r = await query ({
		type:'insert_location',
		params:[restroom,lat,lng,description]
	});

	if(r.error) throw(r.error);

	history.go($("#location-navigateback").val());
}

const checkSearchForm = async (s) => {
	let restrooms = await query({
		type:'search_restrooms',
		params:[s,sessionStorage.userId]
	});

	if(restrooms.error) throw(restrooms.error);

	makeRestroomListSet(restrooms.result);
}

const checkFilter = async (f,v) => {
	let restrooms = await query({
		type:'filter_restrooms',
		params:[f,v,sessionStorage.userId]
	});

	if(restrooms.error) throw(restrooms.error);

	makeRestroomListSet(restrooms.result);
}