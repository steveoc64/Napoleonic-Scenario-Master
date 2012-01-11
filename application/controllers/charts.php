<?php

class Charts extends MY_Controller 
{
	function index()
	{
		$data['main_content'] = 'charts';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}
}
