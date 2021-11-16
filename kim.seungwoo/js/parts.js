
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
<div>
   <h4>${o.name}</h4>
   <h5>&commat;${o.username}</h5>
   <div><a href="#page-user-settings">Settings</a></div>
</div>

<div data-role="main"  class="overscroll display-flex flex-vertical">
	<button class="form-button js-logout">
		Log Out
	</button>
</div>
`;