	<form action="/login" method="post" class="form-auth">
		<h2>Авторизация</h2>
		<label>
			<span>логин:</span>
			<input name="login" maxlength="20" required>
			<div class="both"></div>
		</label>
		<label>
			<span>пароль:</span>
			<input type="password" name="passwd" maxlength="20" required>
			<div class="both"></div>
		</label>
		<label>
			<span>авторизация</span>
			<input type="submit" value="&rarr;">
			<div class="both"></div>
		</label>
		<label class="form-auth-error nod">Ошибка авторизации</label>
	</form>

	<form action="/" class="form-user nod">
		<h2 class="form-user-login"></h2>
		<div>
			<span>зарегистрирован</span>
			<span class="form-user-created"></span>
		</div>
		<label>
			<span>выйти</span>
			<input type="submit" value="&rarr;">
		</label>
	</form>
	<form action="" method="post" class="form-account nod">
		<input type="hidden" name="session_id" value="">
		<h2>
			<span>счёт №</span>
			<span class="form-account-account_id"></span>
		</h2>
		<div>
			<span>создан</span>
			<span class="form-account-created"></span>

			<span>баланс</span>
			<span class="form-account-amount"></span>
		</div>
		<fieldset>
			<legend>
				<h2>Вывод средств</h2>
			</legend>
			<label>
				<span>укажите сумму</span>
				<input type="number" name="amount" min="0" maxlength="22" required>
			</label>
			<label>
				<span>вывести</span>
				<input type="submit" value="&rarr;">
			</label>
		</fieldset>
	</form>
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