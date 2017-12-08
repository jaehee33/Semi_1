<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<form action="kindInsert.kind" method="post" id="frm" enctype="multipart/form-data">
				<p>0
					KIND : <input type="text" name="kind" placeholder="종류를 입력해주세요">
					PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요">
					<input type="file" name="f0">
				</p>
				<p><button>insert</button></p>
			</form>