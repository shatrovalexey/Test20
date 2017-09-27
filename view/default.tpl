<!DOCTYPE html>

<html>
	<head>
		<title>{$config->include->composer->description|htmlspecialchars}</title>
		<meta charset="{$config->charset|htmlspecialchars}">
		{foreach from=$config->include->composer->authors item=author}
		<meta name="author" content="{$author->name|htmlspecialchars} &lt;{$author->email|htmlspecialchars}&gt;">
		{/foreach}
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="/css/style.css" type="text/css">
	</head>
	<body>
		<div class="overlay">{include file=$include}</div>
		<div>
			<span>Авторы:</span>
			{foreach from=$config->include->composer->authors item=author}
				<span>{$author->name|htmlspecialchars} &lt;{$author->email|htmlspecialchars}&gt;</span>
			{/foreach}
		</div>
	</body>
</html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/script.js"></script>