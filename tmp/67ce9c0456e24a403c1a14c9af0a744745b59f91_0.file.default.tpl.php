<?php
/* Smarty version 3.1.31, created on 2017-09-27 15:40:17
  from "/mnt/sdb1/www/test2/view/default.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_59cb9c315c4dd4_31893925',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '67ce9c0456e24a403c1a14c9af0a744745b59f91' => 
    array (
      0 => '/mnt/sdb1/www/test2/view/default.tpl',
      1 => 1506516016,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59cb9c315c4dd4_31893925 (Smarty_Internal_Template $_smarty_tpl) {
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

	</head>
	<body>
	</body>
</html><?php }
}
