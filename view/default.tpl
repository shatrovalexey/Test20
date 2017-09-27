<!DOCTYPE html>

<html>
	<head>
		<title>{$config->include->composer->description|htmlspecialchars}</title>
		<meta charset="{$config->charset|htmlspecialchars}">
		{foreach from=$config->include->composer->authors item=author}
		<meta name="author" content="{$author->name|htmlspecialchars} &lt;{$author->email|htmlspecialchars}&gt;">
		{/foreach}
	</head>
	<body>
	</body>
</html>