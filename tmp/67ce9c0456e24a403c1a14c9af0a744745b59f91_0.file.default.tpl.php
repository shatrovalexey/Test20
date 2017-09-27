<?php
/* Smarty version 3.1.31, created on 2017-09-27 17:17:26
  from "/mnt/sdb1/www/test2/view/default.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_59cbb2f608f547_14731040',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '67ce9c0456e24a403c1a14c9af0a744745b59f91' => 
    array (
      0 => '/mnt/sdb1/www/test2/view/default.tpl',
      1 => 1506521843,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59cbb2f608f547_14731040 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>

<html>
	<head>
		<title><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['config']->value->include->composer->description);?>
</title>
		<meta charset="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['config']->value->charset);?>
">
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['config']->value->include->composer->authors, 'author');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['author']->value) {
?>
		<meta name="author" content="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['author']->value->name);?>
 &lt;<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['author']->value->email);?>
&gt;">
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
?>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="/css/style.css" type="text/css">
	</head>
	<body>
		<div class="overlay"><?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['include']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
</div>
	</body>
</html>
<?php echo '<script'; ?>
 src="https://code.jquery.com/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/js/script.js"><?php echo '</script'; ?>
><?php }
}
