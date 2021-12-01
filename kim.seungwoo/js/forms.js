
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

const userAddForm = async () => {
	let name = $("#user-edit-name").val();
	let username = $("#user-edit-username").val();
	let email = $("#user-edit-email").val();

	let r = await query ({
		type:'insert_user',
		params:[name,username,email,sessionStorage.userId]
	});

	if(r.error) throw(r.error);

	history.go(-1);
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