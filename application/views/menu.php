<div id="menu">
<ul class="vmenu">
<?php


$menu = array('Game' => 'game','Scenarios' => 'scenarios','Nations' => 'nations','Units' => 'units','Cards' => 'cards','Data' => 'data','Charts' => 'charts', 'Rules' => 'rules');


foreach ($menu as $k => $v) {
	echo "<li><a href=\"/nap/site/$v\" ";
	if ($v == $this->uri->segment(2)) {
		echo "class=\"active\" ";
	}
	echo "<span>$k</span></a></li>\n";
}

?>
</ul>
</div>