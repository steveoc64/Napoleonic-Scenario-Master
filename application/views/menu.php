<div id="menu">
<ul class="vmenu">
<?php


$menu = array('Game' => 'game','Scenarios' => 'scenarios','Nations' => 'nations','Units' => 'units','Cards' => 'cards','Data' => 'site/data','Charts' => 'site/charts', 'Rules' => 'site/rules');


foreach ($menu as $k => $v) {
	echo "<li><a href=\"/nap/$v\" ";
	if ($v == $this->uri->segment(2)) {
		echo "class=\"active\" ";
	}
	echo "<span>$k</span></a></li>\n";
}

?>
</ul>
</div>
