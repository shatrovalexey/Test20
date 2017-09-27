<?php
/* Smarty version 3.1.31, created on 2017-09-27 15:54:56
  from "/mnt/sdb1/www/test2/view/index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_59cb9fa0e72e92_51133379',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'aff367784d46d5eefef5a1c32e873b2ef7adcc78' => 
    array (
      0 => '/mnt/sdb1/www/test2/view/index.tpl',
      1 => 1506516895,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59cb9fa0e72e92_51133379 (Smarty_Internal_Template $_smarty_tpl) {
?>
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
</fieldset><?php }
}
