<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Scenario Master</title>
	<link rel="stylesheet" href="http://15mm-madness.com/nap/css/style.css" type="text/css" media="screen">

<?php foreach($css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

</head>
<body>
<body>
<div id="menu">
<ul class="vmenu">
<?php
// Add in the menu
$menu = array('Game' => 'game','Scenarios' => 'scenarios','Nations' => 'nations','Units' => 'units','Cards' => 'cards','Data' => 'data','Charts' => 'charts', 'Rules' => 'rules');
foreach ($menu as $k => $v) {
	echo "<li><a href=\"/nap/$v\" ";
	if ($v == $this->uri->segment(1)) {
		echo "class=\"active\" ";
	}
	echo "<span>$k</span></a></li>\n";
}
?>
</ul>
</div>
<div id="main">
