	<form action="/login" method="post" class="form-auth">
		<fieldset>
			<legend>
				<h2>авторизация</h2>
			</legend>
			<label>
				<span>логин:</span>
				<input name="login" value="test" maxlength="20" required>
				<div class="both"></div>
			</label>
			<label>
				<span>пароль:</span>
				<input type="password" value="test" name="passwd" maxlength="20" required>
				<div class="both"></div>
			</label>
			<label>
				<span>авторизация</span>
				<input type="submit" value="&rarr;">
				<div class="both"></div>
			</label>
			<label class="error nod">Ошибка авторизации</label>
		</fieldset>
	</form>

	<form action="/" class="form-user nod">
		<h2>
			<span>пользователь</span>
			<span class="form-user-login"></span>
		</h2>
		<div>
			<span>зарегистрирован</span>
			<span class="form-user-created"></span>
		</div>
		<label>
			<span>выйти</span>
			<input type="submit" value="&rarr;">
		</label>
	</form>

	<fieldset class="form-account nod">
		<legend>
			<h2>
				<span>счёт №</span>
				<span class="form-account-account_id"></span>
			</h2>
		</legend>
		<div>
			<span>создан</span>
			<span class="form-account-created"></span>
			<span>баланс</span>
			<span class="form-account-amount"></span>
		</div>
	</fieldset>

	<form action="/withdrawal" method="post" class="form-withdrawal nod">
		<input type="hidden" name="session_id" value="">
		<fieldset>
			<legend>
				<h2>вывод средств</h2>
			</legend>
			<label>
				<span>укажите сумму</span>
				<input type="number" name="amount" value="1" min="1" maxlength="22" required>
			</label>
			<label>
				<span>вывести</span>
				<input type="submit" value="&rarr;">
			</label>
			<label class="error nod">Ошибка операции</label>
		</fieldset>
	</form>

	<form action="/fund" method="post" class="form-fund nod both">
		<input type="hidden" name="session_id" value="">
		<fieldset>
			<legend>
				<h2>ввод средств</h2>
			</legend>
			<label>
				<span>укажите сумму</span>
				<input type="number" name="amount" value="1" min="1" maxlength="22" required>
			</label>
			<label>
				<span>ввести</span>
				<input type="submit" value="&rarr;">
			</label>
			<label class="error nod">Ошибка операции</label>
		</fieldset>
	</form>

	<div class="both"></div>

	<form class="form-account-history nod">
		<h2>транзакции</h2>

		<ul class="form-account-history-list">
			<li class="nod">
				<span class="form-account-history-id"></span>
				<span class="form-account-history-datetime"></span>
				<span class="form-account-history-amount"></span>
			</li>
		</ul>
	</form>