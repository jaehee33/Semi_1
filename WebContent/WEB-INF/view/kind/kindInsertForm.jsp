<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<form action="kindInsert.kind" method="post" id="frm" enctype="multipart/form-data">
				<p>0
					KIND : <input type="text" name="style" placeholder="종류를 입력해주세요">
					PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요">
					<select name="kind">
					<option value="펌">펌</option>
					<option value="염색">염색</option>
					<option value="컷">컷</option>
					<option value="매직">매직</option>
					<option value="기타">기타</option>
					</select>
					<input type="file" name="f0">
				</p>
				<p><button>insert</button></p>
			</form>