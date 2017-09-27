<?php
/* Smarty version 3.1.31, created on 2017-09-27 18:23:01
  from "/mnt/sdb1/www/test2/view/index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_59cbc2552049c5_05763145',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'aff367784d46d5eefef5a1c32e873b2ef7adcc78' => 
    array (
      0 => '/mnt/sdb1/www/test2/view/index.tpl',
      1 => 1506524577,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59cbc2552049c5_05763145 (Smarty_Internal_Template $_smarty_tpl) {
?>
	<form action="/login" method="post" class="form-auth">
		<h2>Авторизация</h2>
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
	<form action="/withdrawal" method="post" class="form-account nod">
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
			<label class="error nod">Ошибка операции</label>
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
	</form><?php }
}
