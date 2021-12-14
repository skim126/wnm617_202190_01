
const makeRestroomList = templater((o)=>`
<div class="restroomlist-item">
<div class="display-flex restroom-jump" data-id="${o.id}">
	<div class="flex-none restroomlist-item-image">
		<img src="${o.img}" alt="">
	</div>
	<div class="flex-stretch restroomlist-item-body padding-md">
		<!-- <div class="restroomlist-item-name">Restroom</div> -->
		<div class="restroomlist-item-type"><strong>${o.store}</strong></div>
		<div class="restroomlist-item-password"><strong>Type:</strong> ${o.type}</div>
		<div class="restroomlist-item-password"><strong>Password:</strong> ${o.password}</div>
	</div>
</div>
</div>
`);

const makeUserProfile = (o) => `
<div class="user-profile-image">
   <img src="${o.img}" alt="">
</div>
<div class="padding-md">
   <h4>${o.name}</h4>
   <h5>&commat;${o.username}</h5>
   <div><a href="#page-user-settings">Settings<i class="arrow right"></i></a></div>
</div>

<div data-role="main"  class="overscroll display-flex flex-vertical padding-md">
	<button class="form-button js-logout">
		Log Out
	</button>
</div>
`;

const makeRestroomProfile = (o) => `
<div class="padding-md">
   <h4>${o.store}</h4>
   <div class="form-control">
	   <div style="margin-bottom: 5px;"><strong>Store:</strong> ${o.store}</div>
	   <div style="margin-bottom: 5px;"><strong>Password:</strong> ${o.password}</div>
	   <div style="margin-bottom: 5px;"><strong>Type:</strong> ${o.type}</div>
	   <div style="margin-bottom: 5px;"><strong>Needs:</strong> ${o.needs}</div>
	   <div style="margin-bottom: 5px;"><strong>Description:</strong> <p>${o.description}<p></div>
	</div>
</div>
`;



const makeRestroomPopup = o => `
<div class="display-flex restroom-jump" data-id="${o.restroom_id}">
	<div class="flex-none restroom-popup-image">
		<img src="${o.img}" alt="">
	</div>
	<div class="flex-stretch restroom-popup-body padding-md">
		<!-- <div class="restroom-popup-name">Restroom</div> -->
		<div class="restroom-popup-type"><strong>${o.store}</strong></div>
		<div class="restroom-popup-password"><strong>Type:</strong> ${o.type}</div>
		<div class="restroom-popup-password"><strong>Password:</strong> ${o.password}</div>
	</div>
</div>
`;

const FormControlInput = ({namespace,name,displayname,type,placeholder,value}) => `
	<div class="form-control">
	   <label for="${namespace}-${name}" class="form-label">${displayname}</label>
	   <input type="${type}" id="${namespace}-${name}" class="form-input" data-role="none" placeholder="${placeholder}" value="${value}">
	</div>
   `;

const FormControlTextarea = ({namespace,name,displayname,placeholder,value}) => `
	<div class="form-control">
	   <label for="${namespace}-${name}" class="form-label">${displayname}</label>
	   <textarea id="${namespace}-${name}" class="form-input" data-role="none" placeholder="${placeholder}">${value}</textarea>
	</div>
   `;


const makeRestroomFormInputs = (o,namespace) => `
	${FormControlInput({
		namespace:namespace,
		name:"store",
		displayname:"Store",
		type:"store",
		placeholder:"Type The Restroom Store",
		value:o.store
	})}
	${FormControlInput({
		namespace:namespace,
		name:"password",
		displayname:"Password",
		type:"text",
		placeholder:"Type The Restroom Password",
		value:o.password
	})}
	${FormControlInput({
		namespace:namespace,
		name:"type",
		displayname:"Type",
		type:"text",
		placeholder:"Type The Restroom Type",
		value:o.type
	})}
	${FormControlInput({
		namespace:namespace,
		name:"needs",
		displayname:"Needs",
		type:"needs",
		placeholder:"Type The Restroom Needs",
		value:o.needs
	})}
	${FormControlTextarea({
		namespace:namespace,
		name:"description",
		displayname:"Description",
		placeholder:"Type The Restroom Description",
		value:o.description
	})}

`;


const makeUserFormInputs = (o,namespace) => `
	${FormControlInput({
		namespace:namespace,
		name:"name",
		displayname:"Name",
		type:"text",
		placeholder:"Type The Name",
		value:o.name
	})}
	${FormControlInput({
		namespace:namespace,
		name:"username",
		displayname:"Username",
		type:"text",
		placeholder:"Type The User Handle",
		value:o.username
	})}
	${FormControlInput({
		namespace:namespace,
		name:"email",
		displayname:"Email",
		type:"email",
		placeholder:"Type The Email Address",
		value:o.email
	})}
`;



const makeRestroomChoiceSelect = ({restrooms,store,chosen=0}) => `
<select id="${store}">
   ${templater(o=>`
      <option value="${o.id}" ${o.id===chosen?'selected':''}>${o.store}</option>
   `)(restrooms)}
</select>
`;

const makeRestroomListSet = (arr,target="#page-list .restroomlist") => {
   $(".filter-bar").html(makeFilterList(arr));
	$(target).html(makeRestroomList(arr));
}

const capitalize = s => s[0].toUpperCase()+s.substr(1);

const filterList = (animals,type) => {
   let a = [...(new Set(animals.map(o=>o[type])))];
   return templater(o=>o?`<a href="#" data-filter="${type}" data-value="${o}">${capitalize(o)}</a>`:'')(a);
}

const makeFilterList = (restrooms) => {
	return `
		<a href="#" data-filter="type" data-value="">All</a>
		<div> | </div>
		${filterList(restrooms,'type')}
		<div> | </div>
		${filterList(restrooms,'needs')}
	`;
}