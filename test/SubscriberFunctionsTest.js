const UserStore = artifacts.require("./UserStore")

contract("UserStore", async accounts => {
	const instance = await UserStore.deployed();
	it("should create two user accounts", async() => {
		instance.createUser(
			"ishanjoshi02@gmail.com",
			"ishan",
			"Ishan",
			"Joshi",
			"password123"
		);
		instance.createUser(
			"ishanjoshi01@gmail.com",
			"ishan1",
			"Ishan",
			"Joshi",
			"password1234"
		);
	});
})