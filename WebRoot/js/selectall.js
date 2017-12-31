function selectBox(selectType) {
	var checkboxis = document.getElementsByName("id[]");
	var selectAllBox = document.getElementById("selectAllBox");
	if (selectType == "reverse") {
		for (var i = 0; i < checkboxis.length; i++) {
			//alert(checkboxis[i].checked);
			checkboxis[i].checked = !checkboxis[i].checked;
			selectAllBox.checked = false;
		}
	} else if (selectType == "all") {
		for (var i = 0; i < checkboxis.length; i++) {
			//alert(checkboxis[i].checked);
			checkboxis[i].checked = true;
			selectAllBox.checked = true;
		}
	}
}

function selectUser() {
	var selectAllBox = document.getElementById("selectAllBox");
	var ids = document.getElementsByName("id[]");
	if (selectAllBox.checked) {
		for (var i = 0; i < ids.length; i++) {
			ids[i].checked = true;
		}
	} else {
		for (var i = 0; i < ids.length; i++) {
			ids[i].checked = false;
		}
	}
}
function deleteUser() {
	var count = 0;
	var deleteUser = document.getElementById("deleteUser");
	var ids = document.getElementsByName("id[]");
	for (var i = 0; i < ids.length; i++) {
		if (ids[i].checked) {
			count++;
		}
	}
	//alert(count);
	if (count > 0) {
		swal({
			title : '确定删除吗？',
			text : '你将无法恢复它！',
			type : 'warning',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '确定删除！',
		}).then(function() {
			deleteUser.submit();
		});
	} else {
		//alert("请选择要删除的用户！");
		swal(
			'请选择',
			'你要删除的用户！',
			'warning'
		)
		return false;
	}
}
function deleteFPic() {
	var count = 0;
	var deleteFPic = document.getElementById("deleteFPic");
	var ids = document.getElementsByName("id[]");
	for (var i = 0; i < ids.length; i++) {
		if (ids[i].checked) {
			count++;
		}
	}
	//alert(count);
	if (count > 0) {
		swal({
			title : '确定删除吗？',
			text : '你将无法恢复它！',
			type : 'warning',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '确定删除！',
		}).then(function() {
			deleteFPic.submit();
		});
	} else {
		//alert("请选择要删除的用户！");
		swal(
			'请选择',
			'你要删除的文件或图片！',
			'warning'
		)
		return false;
	}
}