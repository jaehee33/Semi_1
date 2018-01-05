<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="postitl"><ul><li class="style">Style</li><li class="price">Price</li><li class="gender">Gender</li><li class="kind">Kind</li><li class="file">File</li></ul></div>
	<form action="kindInsert.kind" method="post" id="frm" name="frm" enctype="multipart/form-data">
				<p id="frm-item">
					<input type="text" class="emptykind style" name="style" placeholder="종류를 입력해주세요">
					<input type="number" class="emptykind price" name="price" placeholder="가격을 입력해주세요">
					<select name="gender" class="gender">
					<option value="W">Woman</option>
					<option value="M">Man</option>
					</select>
					<select name="kind" class="kind">
					<option value="펌">펌</option>
					<option value="염색">염색</option>
					<option value="컷">컷</option>
					<option value="매직">매직</option>
					<option value="기타">기타</option>
					</select>
					<input type="file" name="f0" class="emptykind file">
				</p>
				<p id="oooo"><input type="button" id="kindbtn" value="INSERT"></p>
			</form>