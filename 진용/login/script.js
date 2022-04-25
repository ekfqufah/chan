// 회원관리 탈퇴처리 확인 메서드 - 0422 진용 
function delete_check_admin(u_id) {
	if(confirm("정말 탈퇴 처리하시겠습니까?")) {
		location.href = "deleteMember.jsp?delete_uid=" + u_id;
	} else {
		location.reload();
	}
}
