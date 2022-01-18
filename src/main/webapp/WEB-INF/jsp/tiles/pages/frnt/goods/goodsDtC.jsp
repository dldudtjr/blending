<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">회사 정보</h3>
	</header>
	<div class="info-wrap mt-30">
		<div class="form-attach-image">
			<input type="file" name="" id="input-file" hidden=""> <label for="input-file">
				<div class="attach-image-thumb">
					<span class="attach-image-thumb-text">Company Logo<br>
					<br>
					<br>
					<br>Upload image
					</span>
					<div class="img-square">
						<div class="img-crop" data-attach-role="bgImg"></div>
					</div>
				</div>
			</label>
		</div>
		<div class="ml-auto info-field">
			<div class="form-field">
				<input type="text" class="input-text" name="" placeholder="회사명" value="">
			</div>
			<div class="form-field">
				<input type="text" class="input-text" name="" placeholder="브랜드명" value="">
			</div>
			<div class="form-field">
				<input type="text" class="input-text" name="" placeholder="회사 등록 번호" value="">
			</div>
			<div class="form-field">
				<div class="input-add add-right2">
					<input type="text" class="input-text" name="" placeholder="Email">
					<button class="button bt-blue-text">인증</button>
				</div>
			</div>
			<div class="form-field select-add">
				<div class="input-add add-right2">
					<div class="custom-select wd-130">
						<select>
							<option value="">+82</option>
							<option value="">+82</option>
							<option value="">+82</option>
						</select>
					</div>
					<input type="text" class="input-text" name="" placeholder="Phone">
					<button class="button">인증완료</button>
				</div>
			</div>
			<div class="form-field">
				<input type="text" class="input-text" name="" placeholder="업종" value="">
			</div>
			<div class="form-field">
				<input type="text" class="input-text" name="" placeholder="산업" value="">
			</div>
			<div class="mt-30 bt-right">
				<a href="#" class="button bt-blue w-140">저장</a>
			</div>
		</div>
	</div>
</div>