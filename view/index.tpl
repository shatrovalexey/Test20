<fieldset>
	<legend>
		<h1>Авторизация</h1>
	</legend>
	<form action="/login" method="post" class="form-auth">
		<label>
			<span>логин:</span>
			<input name="login" maxlength="20">
			<div class="both"></div>
		</label>
		<label>
			<span>пароль:</span>
			<input type="password" name="passwd" maxlength="20">
			<div class="both"></div>
		</label>
		<label>
			<span>авторизация</span>
			<input type="submit" value="&rarr;">
			<div class="both"></div>
		</label>
	</form>
</fieldset>